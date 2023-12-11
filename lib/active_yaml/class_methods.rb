# frozen_string_literal: true

require_relative 'method_mapping'
require_relative 'parser'

module ActiveYaml
  # A module that allows you to use this gem,
  # without creating instances of the class
  module ClassMethods
    include MethodMapping

    def yaml(file_path)
      define_singleton_method(:yaml_data) do
        @yaml_data = Parser.parse(file_path)
      end
    end
  end
end
