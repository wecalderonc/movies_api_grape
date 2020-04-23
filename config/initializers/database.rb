# frozen_string_literal: true

require 'yaml'

# load Sequel Configuration
# settings = YAML.load_file('config/database.yml')
settings = YAML.load(ERB.new(File.read(File.join("config","database.yml"))).result)
DB = Sequel.connect(settings[ENV['RACK_ENV']])

env = ENV['RACK_ENV'] || 'development'

logger = if %w[development test].include? env
           log_dir = File.join(Dir.getwd, 'log')
           log_file = File.join(log_dir, 'db.log')
           FileUtils.mkdir(log_dir) unless Dir.exist?(log_dir)
           Logger.new(File.open(log_file, 'a'))
         else
           Logger.new($stdout)
         end

DB.loggers << logger

# FIXME: maybe remove it later …
#   see: https://groups.google.com/forum/#!topic/sequel-talk/QIIv5qoltjs
Sequel::Model.require_valid_table = false
Sequel::Model.plugin :force_encoding, 'UTF-8'
