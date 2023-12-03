# frozen_string_literal: true

require_relative 'active_yaml/parser'
require_relative 'active_yaml/yaml_hash'
require_relative 'active_yaml/factory_hash'

# The main module from which work with gem begins
module ActiveYaml
  extend FactoryHash

  # Base class to inherit from to create models
  class BaseModel
    def self.yaml(file_path)
      define_method(:yaml_data) do
        @yaml_data = Parser.parse(file_path)
      end
    end

    def method_missing(method, *args, &)
      value = yaml_data[method.to_s]

      if value
        return value unless value.is_a?(Hash)

        YamlHash.new(value)
      else
        super
      end
    end

    def respond_to_missing?(method, include_private = false)
      yaml_data[method.to_s] || super
    end
  end
end
