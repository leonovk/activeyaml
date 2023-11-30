# frozen_string_literal: true

require_relative 'active_yaml/parser'
require_relative 'active_yaml/method_mapper'

module ActiveYaml
  # base
  class Base < MethodMapper
    def self.yaml(file_path)
      define_method(:yaml_file_path) do
        @yaml_file_path = yaml_file_path
      end

      define_method(:yaml_data) do
        @yaml_data = Parser.parse(file_path)
      end
    end
  end
end
