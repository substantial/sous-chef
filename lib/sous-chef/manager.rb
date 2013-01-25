module SousChef
  class Manager
    attr_reader :envs, :parser

    def initialize(config_file)
      @parser = Parser.new(config_file)
      @envs = {}
      initialize_environments
    end

    private

    def initialize_environments
      @parser.parse.each do |name, nodes|
        @envs[name] = Environment.new(name, nodes)
      end
    end
  end
end

