# frozen_string_literal: true

require_relative 'method_mapper'
require_relative 'parser'

module ActiveYaml
  # no doc
  module ClassMethods
    include MethodMapper

    def yaml(file_path)
      define_singleton_method(:yaml_data) do
        @yaml_data = Parser.parse(file_path)
      end
    end
  end
end
