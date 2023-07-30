# Home Assistant Custom Add-on: Samba share with features

![Warning][warning_stripe]

> This is a **fork** of the [official add-on][official_addon]!
>
> Changes:
>   - Restore the possibility to specify `interfaces` in the configuration
>   - Make Samba log level configurable
>
> By default, the configuration is `interfaces: []`, so Samba will run on all
> interfaces and list possible interface values as notice in the log.

> **Note:** Please use `interfaces`, the plural form, with an _**S**_ at the
> end.
>
> The official add-on in the past used a plain string and we were able to add
> multiple interfaces separated with a space, but this forked version uses a
> string list, because this is the way how we should specify multiple items, ie.
> a list, like `veto_files` and `allow_hosts`.
>
> So the correct form is:
>
> ```
> interfaces:
>   - eth0
>   - wlan0
> ```

![Warning][warning_stripe]

This Add-on allows you to enable file sharing across different operating systems over a network.
It lets you access your config files with Windows and macOS devices.

## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate in your Home Assistant frontend to **Settings** -> **Add-ons** ->
   **Add-on Store**.
1. In the **...** menu at the top right corner click **Repositories**, add
   `https://github.com/lmagyar/homeassistant-addon-samba-interface` as
   repository.
1. Find the "Samba share with features" add-on and click it. If it doesn't show
   up, wait until HA refreshes the information about the add-on, or click
   **Check for updates** in the **...** menu at the top right corner.
1. Click on the "INSTALL" button.

## How to use

1. In the configuration section, set a username and password.
   You can specify any username and password; these are not related in any way to the login credentials you use to log in to Home Assistant or to log in to the computer with which you will use Samba share.
1. Save the configuration.
1. Start the add-on.
1. Check the add-on log output to see the result.

## Connection

If you are on Windows you use `\\<IP_ADDRESS>\`, if you are on MacOS you use `smb://<IP_ADDRESS>` to connect to the shares.

This addon exposes the following directories over smb (samba):

Directory | Description
-- | --
`addons` | This is for your local add-ons.
`backup` | This is for your backups.
`config` | This is for your Home Assistant configuration.
`media` | This is for local media files.
`share` | This is for your data that is shared between add-ons and Home Assistant.
`ssl` | This is for your SSL certificates.

## Add-on Configuration

Example add-on configuration:

```yaml
workgroup: WORKGROUP
username: homeassistant
password: YOUR_PASSWORD
interfaces:
  - eth0
  - wlan0
  - lo
allow_hosts:
  - 10.0.0.0/8
  - 172.16.0.0/12
  - 192.168.0.0/16
  - 169.254.0.0/16
  - fe80::/10
  - fc00::/7
veto_files:
  - "._*"
  - ".DS_Store"
  - Thumbs.db
compatibility_mode: false
log_level: info
```

### Option: `workgroup` (required)

Change WORKGROUP to reflect your network needs.

### Option: `username` (required)

The username you would like to use to authenticate with the Samba server.

### Option: `password` (required)

The password that goes with the username configured for authentication.

### Option: `interfaces` (optional)

The network interfaces Samba should listen on for incoming connections.

- This option should only be used in advanced cases. In general, setting this option is not needed.

- If omitted, it is backward compatible with the official add-on: Samba will listen on all supported interfaces of Home Assistant (see `> ha network info`), but if there are no supported interfaces, Samba will exit with an error.

- In case of an empty list (`interfaces: []`, this is the default) Samba will run on all interfaces and list possible interface values as notice in the log.

- For possible interfaces see `> ifconfig` or `> ip link show`.

**Note:** Samba needs at least one non-loopback, non-ipv6, local interface to listen on and become browser on it. Without it, it works, but reloads it's interfaces in an infinite loop forever in each 10 seconds to check, whether a non-loopback, non-ipv6, local interface is added. This reload will fill the log file with infinite number of entries like `added interface lo ip=::1 bcast= netmask=ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff`.

### Option: `allow_hosts` (required)

List of hosts/networks allowed to access the shared folders.

### Option: `veto_files` (optional)

List of files that are neither visible nor accessible. Useful to stop clients
from littering the share with temporary hidden files
(e.g., macOS `.DS_Store` or Windows `Thumbs.db` files)

### Option: `compatibility_mode`

Setting this option to `true` will enable old legacy Samba protocols
on the Samba add-on. This might solve issues with some clients that cannot
handle the newer protocols, however, it lowers security. Only use this
when you absolutely need it and understand the possible consequences.

Defaults to `false`.

### Option: `log_level`

The `log_level` option controls the level of log output by the addon and can
be changed to be more or less verbose, which might be useful when you are
dealing with an unknown issue. Possible values are:

- `trace`: Show every detail, like all called internal functions.
- `debug`: Shows detailed debug information.
- `info`: Normal (usually) interesting events.
- `notice`: Normal but significant events.
- `warning`: Exceptional occurrences that are not errors.
- `error`: Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. Add-on becomes unusable.

Please note that each level automatically includes log messages from a
more severe level, e.g., `debug` also shows `info` messages. By default,
the `log_level` is set to `info`, which is the recommended setting unless
you are troubleshooting.

## Support

Got questions?

You have several options to get them answered:

- The [Home Assistant Discord Chat Server][discord].
- The Home Assistant [Community Forum][forum].
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

In case you've found a bug, please [open an issue on our GitHub][issue].

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/lmagyar/homeassistant-addon-samba-interface/issues
[reddit]: https://reddit.com/r/homeassistant
[warning_stripe]: https://github.com/lmagyar/homeassistant-addon-samba-interface/raw/master/images/warning_stripe_wide.png
[official_addon]: https://github.com/home-assistant/addons/tree/master/samba
