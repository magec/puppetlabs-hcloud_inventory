# hetzner_inventory

#### Table of Contents

1. [Description](#description)
2. [Requirements](#requirements)
3. [Usage](#usage)

## Description

This module includes a Bolt plugin to generate Bolt targets from hetzner cloud servers.

## Requirements

This module requires [`hcloud`](https://rubygems.org/gems/hcloud). You need to install it
manually using bolt's gem command.

```
/opt/puppetlabs/bolt/bin/gem install hcloud
```

## Usage

Hetzner cloud generates one api key per *project*, currently this plugin will add as targets every server inthe project, provided its *api_key*.

Allowed options:

- `api_token`: Hetzner api token

### Examples

`inventory.yaml`
```yaml
groups:
  - name: nodes
    targets:
      - _plugin: hetzner_inventory
	    api_token: SECRET
    config:
      ssh:
        user: user
        proxyjump: user@gateway.example.com
        host-key-check: false
```
