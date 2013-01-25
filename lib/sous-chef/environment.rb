module SousChef
  class Environment
    attr_reader :nodes, :name

    def initialize(name, nodes)
      @nodes = {}
      @name = name
      initialize_nodes(nodes)
    end

    private

    def initialize_nodes(nodes)
      nodes.each do |name, settings|
        @nodes[name] = Node.new(name, settings)
      end
    end
  end
end

