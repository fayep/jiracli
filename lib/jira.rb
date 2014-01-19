require 'version'
require 'wrest'
require 'yaml'
require 'ostruct'

require 'jira/config'
require 'jira/restdata'
require 'jira/jira'
require 'jira/agile'

module Jira
  # Callback invoked before the CLI loads all its command modules.
  def self.before_command_load
    require 'erubis'
    Wrest.logger = Logger.new(STDERR)
    Wrest.logger.level = Logger::INFO
  end

  # Callback invoked after the CLI loads all its command modules.
  def self.after_command_load
  end
end
