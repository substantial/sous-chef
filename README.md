# Sous Chef

Note: This gem is a work in progress.

Manage [knife-solo](http://matschaffer.github.com/knife-solo/) nodes.

## Install

Add the following to your `Rakefile`:

```ruby
  require 'sous-chef'
```

You may run `rake sous_chef` to generate sample `nodes.yml` to `nodes/nodes.yml`

## Configure

Create configuration in knife-solo nodes dir e.g. `nodes/nodes.yml`. Node
configuration is used for sshconfig as well as nodename. Example `nodes.yml`:

```yaml
# Format:
#
# <node name>:
#   node_config: <knife-solo node config e.g. nodes/someNode.json>
#   ssh_config:
#     <ssh config options>
#     e.g.
#     Host: <host alias. defaults to node name>
#     HostName: 12.34.56.789
#     Port: 1234
#     IdentityFile: ~/.ssh/other_id_rsa
#

SuperAwesomeNode:
  node_config: nodes/some_node.json
  ssh_config:
    HostName: 12.34.56.789
    Port 1234
    IdentityFile: ~/.ssh/other_id_rsa

OtherAwesome:
  node_config: nodes/some_node.json
  ssh_config:
    HostName: 12.34.56.789
```

## Usage

`rake -T` for a full list of tasks provided:

