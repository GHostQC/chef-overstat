# Rakefile
require 'bundler/setup'

# [...]

desc 'Run Test Kitchen integration tests'
namespace :integration do
  desc 'Run integration tests with kitchen-docker'
  task :vagrant do
    require 'vagrant'
    require 'kitchen'
    Kitchen.logger = Kitchen.default_file_logger
    @loader = Kitchen::Loader::YAML.new(local_config: '.kitchen.yml')
    Kitchen::Config.new(loader: @loader).instances.each do |instance|
      instance.test(:always)
    end
  end
end

desc 'Run code style lint test w/ RuboCop and FoodCritic'
namespace :lint do
  task :rubocop do
    require 'rubocop/rake_task'
    RuboCop::RakeTask.new(:ruby)
  end
  task :foodcritic do
    require 'foodcritic'
    FoodCritic::Rake::LintTask.new(:chef)
  end
end
