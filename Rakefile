# frozen_string_literal: true

require 'rake'
require 'erb'

require File.expand_path('config/application', __dir__)

task :environment do
  ENV['RACK_ENV'] ||= 'development'
end

# rspec tasks
require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

# rubocop tasks
require 'rubocop/rake_task'
RuboCop::RakeTask.new(:rubocop)

task default: %i[spec rubocop]

# grape-swagger tasks
require 'grape-swagger/rake/oapi_tasks'
GrapeSwagger::Rake::OapiTasks.new(::Api::Base)

# starter tasks
require 'starter/rake/grape_tasks'
Starter::Rake::GrapeTasks.new(::Api::Base)


# Sequel migration tasks
namespace :db do
  Sequel.extension(:migration)

  desc "Prints current schema version"
  task version: :connect do
    version = DB.tables.include?(:schema_info) ? DB[:schema_info].first[:version] : 0

    $stdout.print 'Schema Version: '
    $stdout.puts version
  end

  desc 'Run all migrations in db/migrate'
  task migrate: :connect do
    binding.pry
    Sequel::Migrator.apply(DB, 'db/migrate')
    Rake::Task['db:version'].execute
  end

  desc "Perform rollback to specified target or full rollback as default"
  task :rollback, [:target] => :connect do |t, args|
    args.with_defaults(:target => 0)

    Sequel::Migrator.run(DB, 'db/migrate', :target => args[:target].to_i)
    Rake::Task['db:version'].execute
  end

  desc "Perform migration reset (full rollback and migration)"
  task reset: :connect do
    Sequel::Migrator.run(DB, 'db/migrate', target: 0)
    Sequel::Migrator.run(DB, 'db/migrate')
    Rake::Task['db:version'].execute
  end

  task connect: :environment do
    require './config/initializers/database'
  end
end
