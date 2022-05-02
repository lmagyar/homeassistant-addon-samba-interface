# Changelog

## 9.6.1.7 (forked)

- Add by default an empty list to the interfaces: configuration option, will run on all interfaces by default
- In case of empty list specified, list possible interface values as warning

## 9.6.1.6 (forked)

- Merges final error message from official v9.6.1, not as merged in v9.6.1.5

## 9.6.1.5 (forked)

- Merges final bugfix from official v9.6.1, not as merged in v9.6.1.4

## 9.6.1.4 (forked)

- Better log messages for corner cases

## 9.6.1

- Remove lo from interface list
- Exit with error if there are no supported interfaces to run Samba on
- ~Run on all supported interfaces plus the default interface if it is not part of the supported interfaces list~

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

