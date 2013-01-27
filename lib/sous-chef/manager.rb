class SousChef::Manager
  attr_reader :parser, :nodes

  def initialize(config_file)
    @parser = SousChef::Parser.new(config_file)
    @nodes = {}
    initialize_node_collections
  end

  def tasks
    SousChef::TaskBuilder.new(@nodes).tasks
  end

  private

  def initialize_node_collections
    @parser.parse.each do |name, collection|
      @nodes[name] = SousChef::NodeBuilder.new(name, collection).build
    end
  end
end

