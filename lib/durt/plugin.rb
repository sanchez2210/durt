# frozen_string_literal: true

require 'tty-prompt'

module Durt
  class Plugin
    attr_reader :project, :config

    PLUGINS = %w[Upwork Pivotal Jira Github Internal Ebs].freeze

    def self.all
      PLUGINS.map do |plugin_name|
        klass = "Durt::#{plugin_name}Plugin"

        klass.constantize
      end
    end

    def initialize(project, config = nil)
      @project = project
      @config = config
    end

    def self.find_by_plugin_name(plugin_name)
      all.find { |plugin| plugin.plugin_name == plugin_name.to_s }
    end

    def self.plugin_name
      name.split('::').last.sub('Plugin', '')
    end

    def self.demo_config
      nil
    end

    def filter
      nil
    end

    def before_choose
      nil
    end

    def plugin_name
      self.class.plugin_name
    end

    def choose
      bug_tracker.choose
    end

    def before_enter(_issue)
      # system("#{command} issue.to_json or sth")
      nil
    end

    def enter(_issue)
      # system("#{command} issue.to_json or sth")
      nil
    end

    def start
      # system("#{command} issue.to_json or sth")
      nil
    end

    def stop
      # system("#{command} issue.to_json or sth")
      nil
    end

    def time_tracker
      time_tracker_class
    end

    def bug_tracker
      if config_required? && not_configured?
        raise NotConfiguredError, "#{plugin_name} plugin is not configured"
      end

      bug_tracker_class.new(project, @config)
    end

    private

    def config_required?
      false
    end

    def not_configured?
      @config == self.class.demo_config
    end

    def time_tracker_class
      Durt::NullTimeTracker
    end

    def bug_tracker_class
      Durt::NullBugTracker
    end

    class NotConfiguredError < StandardError
    end
  end
end
