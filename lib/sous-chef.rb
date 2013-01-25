require 'rake'


module SousChef
  CONFIG_FILE = File.join(Dir.pwd, "nodes", "nodes.yml")

  class << self
    def create_config
      template = File.expand_path(File.join(File.dirname(__FILE__), 'templates', 'nodes.example.yml'))
      if File.exists?(CONFIG_FILE)
        puts "nodes.yml already exists"
      else
        puts "Coping example nodes.yml and placing in #{SousChef::CONFIG_FILE}"
        FileUtils.cp(template, CONFIG_FILE)
      end
    end
  end
end

load 'sous-chef/parser.rb'
load 'sous-chef/node.rb'
load 'sous-chef/manager.rb'
load 'sous-chef/tasks.rb'

