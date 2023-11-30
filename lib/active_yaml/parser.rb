# frozen_string_literal: true

require 'psych'

module ActiveYaml
  # base parser
  class Parser
    def self.parse(file_path)
      Psych.safe_load_file(file_path)
    end
  end
end
