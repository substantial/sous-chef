class SousChef::Node
  require 'tempfile'

  def initialize(node_hash)
    @node_hash = node_hash
  end

  def name
    @name ||= @node_hash.keys.first
  end

  def config
    @config ||= @node_hash[name]['node_config']
  end

  def hostname
    @hostname = ssh_hash['Host'] || name
  end

  def ssh_config
    config = "Host #{hostname}\n"
    ssh_attrs.each do |key, value|
      config << "  #{key} #{value}\n"
    end
    config
  end

  def ssh_config_path
    config_file = Tempfile.new('agent_ssh_config')
    config_file.write(ssh_config)
    config_file.close
    at_exit { config_file.delete }
    config_file.path
  end

  private

  def ssh_hash
    @node_hash[name]['ssh_config'] || {}
  end

  def ssh_attrs
    attrs = ssh_hash.clone
    attrs.delete('Host')
    attrs
  end
end

