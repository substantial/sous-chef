class SousChef::Manager
  attr_accessor :parser

  def initialize(config_file)
    @parser = SousChef::Parser.new(config_file)
  end

end

