# frozen_string_literal: true

require_relative 'yaml_hash'

module ActiveYaml
  # A module with methods for implementing tracking methods.
  # In the model in order to proxy them into a hash with YML data
  module MethodRedirection
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
