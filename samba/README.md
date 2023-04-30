# Home Assistant Custom Add-on: Samba share with features

Share your configuration over the network using Windows file sharing.

![Warning][warning_stripe]

> This is a **fork** of the [official add-on][official_addon]!
>
> Changes:
>   - Restore the possibility to specify `interfaces` in the configuration
>   - Make Samba log level configurable
>
> By default, the configuration is `interfaces: []`, so Samba will run on all
> interfaces and list possible interface values as warning in the log.

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

[![GitHub Release][releases-shield]][releases]
[![Last Updated][updated-shield]][updated]
![Reported Installations][installations-shield]
![Project Stage][project-stage-shield]
[![License][license-shield]][licence]

![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]
![Supports armhf Architecture][armhf-shield]
![Supports armv7 Architecture][armv7-shield]
![Supports i386 Architecture][i386-shield]

[![Github Actions][github-actions-shield]][github-actions]
![Project Maintenance][maintenance-shield]
[![GitHub Activity][commits-shield]][commits]

## About

This Add-on allows you to enable file sharing across different operating systems over a network.
It lets you access your config files with Windows and macOS devices.

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[commits-shield]: https://img.shields.io/github/commit-activity/y/lmagyar/homeassistant-addon-samba-interface.svg
[commits]: https://github.com/lmagyar/homeassistant-addon-samba-interface/commits/master
[github-actions-shield]: https://github.com/lmagyar/homeassistant-addon-samba-interface/workflows/Publish/badge.svg
[github-actions]: https://github.com/lmagyar/homeassistant-addon-samba-interface/actions
[installations-shield]: https://img.shields.io/badge/dynamic/json?label=reported%20installations&query=$[%27ba124dcc_samba%27].total&url=https%3A%2F%2Fanalytics.home-assistant.io%2Faddons.json
[license-shield]: https://img.shields.io/github/license/lmagyar/homeassistant-addon-samba-interface.svg
[licence]: https://github.com/lmagyar/homeassistant-addon-samba-interface/blob/master/LICENSE
[maintenance-shield]: https://img.shields.io/maintenance/yes/2023.svg
[project-stage-shield]: https://img.shields.io/badge/project%20stage-production%20ready-green.svg
[releases-shield]: https://img.shields.io/github/tag/lmagyar/homeassistant-addon-samba-interface.svg?label=release
[releases]: https://github.com/lmagyar/homeassistant-addon-samba-interface/tags
[updated-shield]: https://img.shields.io/github/last-commit/lmagyar/homeassistant-addon-samba-interface/master?label=updated
[updated]: https://github.com/lmagyar/homeassistant-addon-samba-interface/commits/master
[warning_stripe]: https://github.com/lmagyar/homeassistant-addon-samba-interface/raw/master/images/warning_stripe_wide.png
[official_addon]: https://github.com/home-assistant/addons/tree/master/samba
