# Home Assistant Add-on: Samba share - with interfaces configuration

![Warning][warning_stripe]

> This is a **fork** of the [official add-on][official_addon]! This restores the possibility to specify `interfaces` in the configuration.
>
> Updates are released when the official add-on changes (changes are merged).

![Warning][warning_stripe]

## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate in your Home Assistant frontend to **Supervisor** -> **Add-on Store**.
2. Click **Repositories** in the **...** menu at the top right corner, add `https://github.com/lmagyar/homeassistant-addon-samba-interface` as repository.
3. Find the "Samba share - with interfaces configuration" add-on and click it. If it doesn't show up, wait until HA refreshes the information about the add-on, or click **Reload** in the **...** menu at the top right corner.
4. Click on the "INSTALL" button.

## How to use

1. In the configuration section, set a username and password.
   You can specify any username and password; these are not related in any way to the login credentials you use to log in to Home Assistant or to log in to the computer with which you will use Samba share.
2. Save the configuration.
3. Start the add-on.
4. Check the add-on log output to see the result.

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

## Configuration

Add-on configuration:

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
  - fe80::/10
veto_files:
  - "._*"
  - ".DS_Store"
  - Thumbs.db
compatibility_mode: false
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

- If omitted, Samba will listen on the default primary interface of Home Assistant (see `> ha network info`).

- For other possible interfaces see `> ip link show`.

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

## Support

Got questions?

You have several options to get them answered:

- The [Home Assistant Discord Chat Server][discord].
- The Home Assistant [Community Forum][forum].
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

In case you've found a bug, please [open an issue on our GitHub][issue].

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/hassio-addons/issues
[reddit]: https://reddit.com/r/homeassistant
[repository]: https://github.com/hassio-addons/repository
[warning_stripe]: https://github.com/lmagyar/homeassistant-addon-samba-interface/raw/master/samba/warning_stripe_wide.png
[official_addon]: https://github.com/home-assistant/addons/tree/master/samba
