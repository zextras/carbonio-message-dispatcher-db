<h1 align="center">Carbonio Message Dispatcher DB 🚀</h1>

<div align="center">
Service sidecar used by Zextras Carbonio Message Dispatcher to communicate
with a centralized database

[![Contributors][contributors-badge]][contributors]
[![Activity][activity-badge]][activity]
[![License][license-badge]](COPYING)
[![Project][project-badge]][project]
[![Twitter][twitter-badge]][twitter]

</div>

## How to Build 🔧

To build artifacts locally, run the `build-artifacts.sh` script. You'll need
docker installed locally.

## How to install 🏁

### Preparing the environment

- Install PostgreSQL: `apt install postgresql`
- Create a `postgres` superuser:

  ```bash
  # sudo -u postgres psql
  # CREATE ROLE "carbonio_adm" WITH LOGIN SUPERUSER encrypted password
  'your-secret-password';
  # \q
  ```

### Installation

Install `carbonio-message-dispatcher-db` via apt:

```bash
sudo apt install carbonio-message-dispatcher-db
```

or via yum:

 ```bash
sudo yum install carbonio-message-dispatcher-db
```

### Configuration

In order to make it work with external databases the
`carbonio-message-dispatcher-db.hcl`
**MUST** be manually
updated by changing the address from `127.0.0.1` to the remote address. To
finalize the
configuration:

- Execute `pending-setups` in order to register the service in
  the `service-discover`
- Bootstrap the Message Dispatcher database:

  ```bash
  PGPASSWORD=your-secret-password carbonio-message-dispatcher-db-bootstrap
  carbonio_adm 127.0.0.1
  ```

If the bootstrap script is executed multiple times it reuses the credentials
created the first time and stored in `service-discover`.

### Reading config values

All the necessary configurations are saved automatically in
the `service-discover` configuration
system. They can be retrieved with the following commands:

- `consul kv get -token-file="/etc/carbonio/message-dispatcher/service-discover
  /token" "carbonio-message-dispatcher-db/db-name"`
- `consul kv get -token-file="/etc/carbonio/message-dispatcher/service-discover
  /token" "carbonio-message-dispatcher-db/db-username"`
- `consul kv get -token-file="/etc/carbonio/message-dispatcher/service-discover
  /token" "carbonio-message-dispatcher-db/db-password"`

***

## License 📚

Message Dispatcher database service for Zextras Carbonio.

Released under the AGPL-3.0-only license as specified here: [COPYING](COPYING).

Copyright (C) 2023 Zextras <https://www.zextras.com>

This program is free software: you can redistribute it and/or modify it
under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, version 3 only of the License.
This program is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License
for more details.

You should have received a copy of the GNU Affero General Public License
along with this program. If not, see [Licenses - GNU Project - Free
Software Foundation](https://www.gnu.org/licenses/licenses.html
"https://www.gnu.org/licenses/licenses.html")

See [COPYING](COPYING) file for the project license details

## Copyright and Licensing notices

All non-software material (such as, for example, names, images, logos,
sounds) is owned by Zextras s.r.l. and is licensed under CC-BY-NC-SA
(<https://creativecommons.org/licenses/by-nc-sa/4.0/>).
Where not specified, all source files owned by Zextras s.r.l. are licensed
under AGPL-3.0-only.

[contributors-badge]: https://img.shields.io/github/contributors/zextras/carbonio-user-management-sdk "Contributors"

[contributors]: https://github.com/zextras/carbonio-user-management-sdk/graphs/contributors "Contributors"

[activity-badge]: https://img.shields.io/github/commit-activity/m/zextras/carbonio-user-management-sdk "Activity"

[activity]: https://github.com/zextras/carbonio-user-management-sdk/pulse "Activity"

[license-badge]: https://img.shields.io/badge/license-AGPL-blue.svg

[project-badge]: https://img.shields.io/badge/project-carbonio-informational "Project Carbonio"

[project]: https://www.zextras.com/carbonio/ "Project Carbonio"

[twitter-badge]: https://img.shields.io/twitter/follow/zextras?style=social&logo=twitter "Follow on Twitter"

[twitter]: https://twitter.com/intent/follow?screen_name=zextras "Follow Zextras on Twitter"
