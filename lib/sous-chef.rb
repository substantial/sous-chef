
module SousChef
  CONFIG_FILE = File.join(Dir.pwd, "nodes", "nodes.yml")
  CONFIG_TEMPLATE = File.expand_path(File.join(File.dirname(__FILE__), 'templates', 'nodes.example.yml'))

  def create_config
    if File.exists?(CONFIG_FILE)
      puts "nodes.yml already exists"
    else
      puts "Coping example nodes.yml and placing in #{SousChef::CONFIG_FILE}"
      FileUtils.cp(CONFIG_TEMPLATE, CONFIG_FILE)
    end
  end

  module_function :create_config
end

require 'helpers/node_helpers'
require 'sous-chef/parser'
require 'sous-chef/node_tasks'
require 'sous-chef/node'
require 'sous-chef/collection'
require 'sous-chef/task_builder'
require 'sous-chef/node_builder'
require 'sous-chef/node_manager'
require 'sous-chef/tasks'

