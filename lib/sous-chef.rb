
module SousChef
  CONFIG_TEMPLATE = File.expand_path(File.join(File.dirname(__FILE__), 'templates', 'nodes.example.yml'))
  CONFIG_FILE = File.join(Dir.pwd, "nodes", "nodes.yml")

  def config_file_location
    CONFIG_FILE
  end

  def config_template_location
    CONFIG_TEMPLATE
  end

  def create_config
    if File.exists?(config_file_location)
      puts "nodes.yml already exists"
    else
      puts "Coping example nodes.yml and placing in #{config_file_location}"
      FileUtils.cp(config_template_location, config_file_location)
    end
  end

  module_function :create_config, :config_file_location, :config_template_location
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

