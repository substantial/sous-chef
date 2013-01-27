class SousChef::NodeBuilder
  attr_reader :nodes

  def initialize(name, config_hash)
    @name = name
    @config_hash = config_hash
    @nodes = SousChef::Collection.new(@node)
  end

  def build
    if node?(@config_hash)
      SousChef::Node.new(@name, @config_hash)
    else
      build_nodes
    end
  end

  def node?(settings_hash)
    settings_hash.has_key?('node_config') || settings_hash.has_key?('ssh_config')
  end

  private

  def build_nodes
    @config_hash.each do |name, collection_hash|
      @nodes[name] = SousChef::NodeBuilder.new(name, collection_hash).build
    end
    @nodes
  end
end

