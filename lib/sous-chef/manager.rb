module SousChef
  class Manager
    attr_accessor :nodes
    attr_reader :parser

    def initialize(config_file)
      @parser = Parser.new(config_file)
      @nodes = {}
      initialize_nodes
    end

    def all
      @nodes.keys
    end

    private

    def initialize_nodes
      @parser.parse.each do |node, settings|
        @nodes[node] = Node.new(node, settings)
      end
    end

  end
end
