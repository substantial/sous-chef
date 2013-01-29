class SousChef::NodeBuilder
  include SousChef::NodeHelpers

  def initialize(name, collection_hash)
    @name = name
    @collection_hash = collection_hash
  end

  def build
    if node?(@collection_hash)
      SousChef::Node.new(@name, @collection_hash)
    else
      build_nodes
    end
  end

  private

  def build_nodes
    nodes = SousChef::Collection.new(@name)
    @collection_hash.each do |name, collection_hash|
      nodes[name] = SousChef::NodeBuilder.new(name, collection_hash).build
    end
    nodes
  end
end

