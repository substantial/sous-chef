# Sous Chef

Note: This gem is a work in progress.

Manage knife-solo nodes.

## Install

Add the following to your `Rakefile`:

```ruby
  require 'sous-chef'
```

## Configure

Create configuration in knife-solo nodes dir e.g. `nodes/nodes.yml`. Node
configuration is used for sshconfig as well as nodename. Example `nodes.yml`:

```yaml
SuperAwesomeNode:
  HostName: 12.34.56.789
  Port 1234
  IdentityFile: ~/.ssh/other_id_rsa


OtherAwesome:
  HostName: localhost
```

## Usage

`rake -T` for a full list of tasks provided:

