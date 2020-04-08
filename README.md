# hetzner_inventory

#### Table of Contents

1. [Description](#description)
2. [Requirements](#requirements)
3. [Instllation](#installation)
4. [Usage](#usage)

## Description

This module includes a Bolt plugin to generate Bolt targets from hetzner cloud servers.

## Requirements

This module requires [`hcloud`](https://rubygems.org/gems/hcloud). You need to install it
manually using bolt's gem command.

```
/opt/puppetlabs/bolt/bin/gem install hcloud
```
## Installation

Add this line to your Puppetfile:

```
mod 'puppetlabs-hcloud_inventory', :git => 'https://github.com/magec/puppetlabs-hcloud_inventory.git'
```

and execute:

```
$ bolt puppetfile install
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
      - _plugin: hcloud_inventory
	    api_token: SECRET
    config:
      ssh:
        user: user
        proxyjump: user@gateway.example.com
        host-key-check: false
```
