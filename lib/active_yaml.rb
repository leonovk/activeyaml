# frozen_string_literal: true

require_relative 'active_yaml/parser'
require_relative 'active_yaml/method_mapper'
require_relative 'active_yaml/factory_hash'
require_relative 'active_yaml/class_methods'

# The main module from which work with gem begins
module ActiveYaml
  extend FactoryHash

  # Base class to inherit from to create models
  class BaseModel
    include MethodMapper

    def self.yaml(file_path)
      define_method(:yaml_data) do
        @yaml_data = Parser.parse(file_path)
      end
    end
  end
end
