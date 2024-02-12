# frozen_string_literal: true

require_relative 'yaml_hash'

module ActiveYaml
  # A module containing methods that allow you to track method calls,
  # and compare them with data from the YML file
  module MethodMapping
    def method_missing(method, *args, &block)
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
