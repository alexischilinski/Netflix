require 'bundler/setup'
Bundler.require

require 'active_record'
require 'sinatra/activerecord'
require 'sqlite3'
require 'pry'
require 'require_all'
require 'colorize'
require 'colorized_string'

require_all 'lib'

ActiveRecord::Base.logger = nil