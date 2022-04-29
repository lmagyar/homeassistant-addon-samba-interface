#!/usr/bin/with-contenv bashio
# ==============================================================================
# Prepare the Samba service for running
# ==============================================================================
declare password
declare username
declare -a interfaces=()
export HOSTNAME

# Check Login data
if ! bashio::config.has_value 'username' || ! bashio::config.has_value 'password'; then
    bashio::exit.nok "Setting a username and password is required!"
fi

# Read hostname from API or setting default "hassio"
HOSTNAME=$(bashio::info.hostname)
if bashio::var.is_empty "${HOSTNAME}"; then
    bashio::log.warning "Can't read hostname, using default."
    HOSTNAME="hassio"
fi
bashio::log.info "Hostname: ${HOSTNAME}"

# Determine interfaces list
if bashio::config.exists 'interfaces'; then
    # Configuration exists, use configured values
    for interface in $(bashio::config 'interfaces'); do
        interfaces+=("${interface}")
    done
else
    # Configuration doesn't exist, default to the official add-on
    # Get supported interfaces
    for interface in $(bashio::network.interfaces); do
        interfaces+=("${interface}")
    done
    if [ ${#interfaces[@]} -eq 0 ]; then
        bashio::log.fatal
        bashio::log.fatal 'No supported interfaces found to bind on.'
        bashio::log.fatal
        bashio::log.fatal 'Please use the optional interfaces: configuration option'
        bashio::log.fatal 'to specify the interfaces Samba should bind to.'
        bashio::log.fatal
        bashio::exit.nok
    fi
fi
if [ ${#interfaces[@]} -eq 0 ]; then
    bashio::log.info "Interfaces: <empty list, running on all interfaces>"
else
    bashio::log.info "Interfaces: $(printf '%s ' "${interfaces[@]}")"
fi

# Generate Samba configuration.
jq ".interfaces = $(jq -c -n '$ARGS.positional' --args -- "${interfaces[@]}")" /data/options.json \
    | tempio \
      -template /usr/share/tempio/smb.gtpl \
      -out /etc/samba/smb.conf

# Init user
username=$(bashio::config 'username')
password=$(bashio::config 'password')
addgroup "${username}"
adduser -D -H -G "${username}" -s /bin/false "${username}"
# shellcheck disable=SC1117
echo -e "${password}\n${password}" \
    | smbpasswd -a -s -c "/etc/samba/smb.conf" "${username}"
