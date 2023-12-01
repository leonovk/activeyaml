# frozen_string_literal: true

require 'psych'

module ActiveYaml
  # The main parser of Yaml files, uses psych under the hood
  class Parser
    def self.parse(file_path)
      Psych.safe_load_file(file_path)
    end
  end
end
