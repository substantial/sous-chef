# Sous Chef

Manage [knife-solo](http://matschaffer.github.com/knife-solo/) nodes.

## Usage

Simply ensure the gem is installed using:

    gem install sous-chef

Or add this to your Gemfile if you use bundler:

    gem 'sous-chef'

And add the following to your `Rakefile`:

```ruby
  require 'sous-chef'
```

Run `rake sous_chef:init` to place a sample `nodes.yml` under `nodes/nodes.yml`

Run `rake -T` to display nodes and commands defined in `nodes/nodes.yml`

## Configure

Node configuration is  done in `nodes/nodes.yml`. You can namespace your nodes
however you want. You can run multiple tasks in parallel using the `:all:`
namespace Example `nodes.yml`:

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

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

