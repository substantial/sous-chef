# SousChef

Note: This gem is a work in progress.

Manage knife-solo nodes.

## Install

Add the following to your `Rakefile`:

```ruby
  require 'sous-chef'
```

## Configure

nodes.yml

Create `nodes.yml` in your root. Example `nodes.yml`:

Key is node name and everything underneath is used for the sshconfig

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

