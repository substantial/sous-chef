
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

require 'sous-chef/parser.rb'
require 'sous-chef/node.rb'
require 'sous-chef/collection.rb'
require 'sous-chef/task_builder.rb'
require 'sous-chef/node_builder.rb'
require 'sous-chef/manager.rb'
require 'sous-chef/tasks.rb'

