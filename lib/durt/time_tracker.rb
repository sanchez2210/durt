# frozen_string_literal: true

module Durt
  class TimeTracker
    def self.active?
      true
    end

    def self.switch_project(_project); end

    def self.enter(_memo)
      raise NotImplementedError
    end

    def self.start
      raise NotImplementedError
    end

    def self.stop
      raise NotImplementedError
    end
  end
end
