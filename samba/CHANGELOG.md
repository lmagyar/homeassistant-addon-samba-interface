# Changelog

## vNext (forked)

- Update Samba to v4.18.9-r0
- Update Add-on base image to v15.0.5 (Update Alpine base image to v3.19.0)

## 12.2.0.0 (forked)

- Revert: Make Samba log level configurable
- Merge upstream changes

## 12.2.0

- Decrease Samba log level

## 12.1.0.0 (forked)

_No functional changes, just got the versioning in sync with the original add-on._

## 12.1.0

- Use the new Home Assistant folder for the `config` share
- Add support for accessing public add-on configurations

## 12.0.0

- Temporary remove access to add-on config shares, until Supervisor 2023.11.2 has been rolled out stable
- Revert `config` share name change to avoid user facing change
- Adjust location of Home Assistant config to match latest dev/beta Supervisor
- ~Migrate add-on layout to S6 Overlay~ (forked version already migrated it's layout)

## 11.0.0.2 (forked)

***BREAKING CHANGES:***
- The `homeassistant` share has been renamed BACK to `config` (this will be the final name in the original add-on also)

  ***Note:*** This fork doesn't drop temporarily the access to the `addon_configs` share until the new Supervisor release is out

Nonbreaking changes:
- Update Add-on base image to v14.3.2

## 11.0.0.1 (forked)

***BREAKING CHANGES:***
- Drop support for armhf & i386
- In case of an empty list (`interfaces: []`, this is the default) Samba will run on localhost (127.0.0.1) only, and not on all interfaces. If you previously used the default settings, please list interfaces explicitly. This is due to the changes from the original add-on: localhost by default is added to the interfaces list (to support HEALTCHECK), so we can't use Samba's default behaviour to run on all interfaces in case of an empty list (there is no empty list from now on).
- Merge changes from original add-on
  - The `config` share has been renamed to `homeassistant`
  - The `addon_configs` share has been added to access public add-on configurations

Nonbreaking changes:
- Update Samba to v4.18.8-r0
- Update Add-on base image to v14.3.1

## 11.0.0

- The `config` share has been renamed to `homeassistant` to match upstream changes.
- Add support for accessing public add-on configurations
- ~~Update to Alpine 3.18~~ (forked version already runs on Alpine 3.18)
- Adds HEALTCHECK support

## 10.0.2.3 (forked)

- Update Samba to v4.18.5-r0
- Update Add-on base image to v14.1.0 (Update Alpine base image to v3.18.3)
- Remove workaround for LOG_LEVEL environment variable superfluous newline character

## 10.0.2.2 (forked)

- Workaround for LOG_LEVEL environment variable superfluous newline character

## 10.0.2.1 (forked)

- Update Samba to v4.18.4-r0
- Update Add-on base image to v14.0.2
- Sign add-on with Sigstore Cosign

## 10.0.2.0 (forked)

- Merge upstream changes

## 10.0.2

- Enable IPv6 ULA and IPv4 link-local addresses by default

## 10.0.1.1 (forked)

- Update Samba to v4.18.2-r0
- Update Add-on base image to v14 (Update Alpine base image to v3.18.0)

## 10.0.1.0 (forked)

- Make Samba log level configurable
- In case of empty interface list use only notice log level, not warning
- Migrate add-on layout to S6 Overlay
- Update Add-on base image to v13.2.2

## 10.0.1

- ~~Update to Alpine 3.17~~ (forked version already runs on Alpine 3.17)

## 10.0.0.3 (forked)

- Bump base image to 2023.02.0

## 10.0.0.2 (forked)

- Bump base image to 2022.11.0

## 10.0.0.1 (forked)

- Bump base image to 2022.09.0

## 10.0.0.0 (forked)

- Merge upstream changes

## 10.0.0

BREAKING CHANGE: Don't mangle filenames

By default, Samba mangles filenames with special characters to ensure
compatibility with really old versions of Windows which have a very limited
charset for filenames. The add-on no longer does this as modern operating
systems do not have these restrictions.

- Don't mangle filenames (fixes #2541)
- Upgrade Alpine Linux to 3.16

## 9.7.0.0 (forked)

- Merge upstream changes

## 9.7.0

- Upgrade Alpine Linux to 3.15
- Sign add-on with Codenotary Community Attestation Service (CAS)

## 9.6.1.7 (forked)

- Add by default an empty list to the `interfaces:` configuration option, will run on all interfaces by default
- In case of an empty list specified, list possible interface values as warning in the log

## 9.6.1.6 (forked)

- Merges final error message from official v9.6.1, not as merged in v9.6.1.5

## 9.6.1.5 (forked)

- Merges final bugfix from official v9.6.1, not as merged in v9.6.1.4

## 9.6.1.4 (forked)

- Better log messages for corner cases

## 9.6.1

- Remove lo from interface list
- Exit with error if there are no supported interfaces to run Samba on
- ~~Run on all supported interfaces plus the default interface if it is not part of the supported interfaces list~~

## 9.6.0.3 (forked)

- Fix ShellCheck errors

## 9.6.0.2 (forked)

- Restore optional interfaces list, by default run on all supported interfaces

## 9.6.0.1 (forked)

- Run on all supported interfaces, no config available

## 9.6.0.0 (forked)

- Extend required interface option to optional interfaces list
- Restore interface options

## 9.6.0

- Run on all supported interfaces

## 9.5.1

- Add `hassio_api` to add-on configuration

## 9.5.0

- Remove interface options in favor of network

## 9.4.0

- Upgrade Alpine Linux to 3.13
- Rewrite configuration generation code

## 9.3.1

- Update options schema for passwords

## 9.3.0

- Support new media folder
- Update Samba to 4.12.6
- Upgrade Alpine Linux to 3.12

## 9.2.0

- Pin base image version
- Rewrite add-on onto S6 Overlay
- Use default configuration location
- Add support for running in compatibility mode (SMB1/NT1)
- Add dummy files to reduce number of errors/warnings in log output

## 9.1.0

- Allow IPv6 link-local hosts by default, consistent with IPv4

## 9.0.0

- New option `veto_files` to limit writing of specified files to the share

## 8.3.0

- Fixes a bug in warning log message, causing start failure
- Minor code cleanups

## 8.2.0

- Update from bash to bashio

## 8.1.0

- Update Samba to version 4.8.8

## 8.0.0

- Fix access to /backup
