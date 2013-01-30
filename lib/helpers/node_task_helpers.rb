require 'rake'

module SousChef::NodeTaskHelpers
  include Rake::DSL

  module_function

  def build_node_task(node)
    namespace node.name do
      prepare_task(node)
      cook_task(node)
      bootstrap_task(node)
      clean_task(node)
    end
  end

  def clean_task(node)
    desc "Run knife solo clean for #{node.name}"
    task :clean do
      run_knife 'clean', node
    end
  end

  def cook_task(node)
    desc "Run knife solo cook for #{node.name}"
    task :cook do
      run_knife 'cook', node
    end
  end

  def bootstrap_task(node)
    desc "Run knife solo bootstrap for #{node.name}"
    task :bootstrap do
      run_knife 'bootstrap', node
    end
  end

  def prepare_task(node)
    desc "Run knife solo prepare for #{node.name}"
    task :prepare do
      run_knife 'prepare', node
    end
  end

  def batch_tasks(name, tasks)
    task_names = tasks.map(&:name)

    desc "Run knife solo prepare for all #{name} nodes"
    multitask :prepare => filter_tasks(task_names, 'prepare')

    desc "Run knife solo cook for all #{name} nodes"
    multitask :cook => filter_tasks(task_names, 'cook')

    desc "Run knife solo bootstrap for all #{name} nodes"
    multitask :bootstrap => filter_tasks(task_names, 'bootstrap')

    desc "Run knife solo clean for all #{name} nodes"
    multitask :clean => filter_tasks(task_names, 'clean')
  end

  def filter_tasks(tasks_names, desired_task)
    tasks_names.clone.keep_if { |task_name| task_name.include? desired_task }
  end

  def run(command)
    puts "Running: #{command}"
    system command
    raise "Failure! #{$?}" if $? != 0
  end

  def run_knife(command, node)
    options = "-F #{node.ssh_config_path} #{node.hostname}"
    options = "#{options} -N #{node.name} #{node.config}" unless %w[clean].include? command
    run "knife solo #{command} #{options}"
  end
end

