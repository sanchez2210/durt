# frozen_string_literal: true

require_relative 'plugin'

module Durt
  class InternalPlugin < Plugin
    def start
      time_tracker.start
    end

    def stop
      time_tracker.stop
    end

    def time_tracker
      Durt::InternalTracker
    end

    def bug_tracker
      Durt::InternalBugTracker.new
    end

    private

    def prompt
      @prompt ||= TTY::Prompt.new
    end
  end
end
