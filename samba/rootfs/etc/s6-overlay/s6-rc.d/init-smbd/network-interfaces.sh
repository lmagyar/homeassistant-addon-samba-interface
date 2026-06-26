#!/usr/bin/with-contenv bash
# vim: ft=bash
# shellcheck shell=bash

# Populate the provided array variable with enabled network interfaces.
get_enabled_interfaces() {
    local -n _out_interfaces=$1
    local interface
    local interface_enabled

    _out_interfaces=()
    for interface in $(bashio::config 'interfaces'); do
        if ! bashio::fs.file_exists "/sys/class/net/${interface}/operstate"; then
            bashio::log.warning "Interface ${interface} doesn't exist, skipping it"
        elif ! [[ "$(cat "/sys/class/net/${interface}/operstate")" =~ ^(up|unknown)$ ]]; then
            bashio::log.warning "Interface ${interface} is disabled, skipping it"
        else
            _out_interfaces+=("${interface}")
        fi
    done
}
