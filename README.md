# Sous Chef

Manage [knife-solo](http://matschaffer.github.com/knife-solo/) nodes.

## Install

Add the following to your `Rakefile`:

```ruby
  require 'sous-chef'
```

You may run `rake sous_chef:init` to generate sample `nodes.yml` to
`nodes/nodes.yml`

## Configure

Create configuration in knife-solo nodes dir e.g. `nodes/nodes.yml`. Node
configuration is used for sshconfig as well as nodename. You can namespace
nodes however you want. Example `nodes.yml`:

```yaml
# Format:
#
# <environment>:
#   <other-namespace>:
#     <node name>:
#       node_config: <knife-solo node config e.g. nodes/someNode.json>
#       ssh_config:
#         <ssh config options>
#         e.g.
#         Host: <host alias. defaults to node name>
#         HostName: 12.34.56.789
#         Port: 1234
#         IdentityFile: ~/.ssh/other_id_rsa

production:
  web:
    SuperAwesomeNode:
      node_config: nodes/some_node.json
      ssh_config:
        HostName: 12.34.56.789
        Port 1234
        IdentityFile: ~/.ssh/other_id_rsa
staging:
  CoolWorld:
    node_config: nodes/some_node.json
    ssh_config:
      HostName: localhost

vagrant:
  node_config: nodes/buildAgent.json
  ssh_config:
    HostName: 127.0.0.1
    User: vagrant
    Port: 2222
    UserKnownHostsFile: /dev/null
    StrictHostKeyChecking: "no"
    PasswordAuthentication: "no"
    IdentityFile: "~/.vagrant.d/insecure_private_key"
    IdentitiesOnly: "yes"
    ForwardAgent: "yes"
```

## Usage

`rake -T` for a full list of tasks provided:

The `:all` namespace will execute specified rake task for all nodes under the
parent namespace. e.g. `rake production:all:cook` or `rake
production:web:all:cook`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

