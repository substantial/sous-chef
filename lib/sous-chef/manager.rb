class SousChef::Manager
  attr_accessor :parser, :nodes

  def initialize(config_file)
    @parser = SousChef::Parser.new(config_file)
    @nodes = []
    initialize_nodes
  end

  private

  def initialize_nodes
    @parser.parse.each do |node|
      @nodes << SousChef::Node.new(node)
    end
  end

end

