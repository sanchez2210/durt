# frozen_string_literal: true

module Durt
  class ApplicationRecord < ::ActiveRecord::Base
    self.abstract_class = true

    scope :to_choice_h, -> { Hash[map { |r| [r.to_s, r] }] }

    def active!
      reload.update(active: true)
    end
  end
end
