class SousChef::Node
  attr_reader :name

  require 'tempfile'

  def initialize(node, settings)
    @settings = settings
    @name = node
  end

  def config
    @config ||= @settings['node_config'] || {}
  end

  def hostname
    @hostname ||= ssh_hash['Host'] || @name
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
    @ssh_hash ||= @settings['ssh_config'] || {}
  end

  def ssh_attrs
    attrs = ssh_hash.clone
    attrs.delete('Host')
    attrs
  end
end

