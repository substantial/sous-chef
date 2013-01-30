module SousChef::NodeHelpers

  module_function

  def node?(settings)
    settings.is_a? SousChef::Node or settings.has_key?('node_config') or
      settings.has_key?('ssh_config')
  end

end

