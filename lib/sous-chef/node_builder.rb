class SousChef::NodeBuilder
  include SousChef::NodeHelpers

  def initialize(name, config_hash)
    @name = name
    @config_hash = config_hash
  end

  def build
    if node?(@config_hash)
      SousChef::Node.new(@name, @config_hash)
    else
      build_nodes
    end
  end

  private

  def build_nodes
    nodes = SousChef::Collection.new(@name)
    @config_hash.each do |name, collection_hash|
      nodes[name] = SousChef::NodeBuilder.new(name, collection_hash).build
    end
    nodes
  end
end

