class SousChef::Parser
  attr_reader :config_file

  def initialize(config_file)
    @config_file = config_file
  end

  def parse
    parse_yaml(@config_file)
  end

  private

  def parse_yaml(config_file)
    if File.exists?(config_file)
      YAML.load_file(config_file)
    else
      {}
    end
  end
end

