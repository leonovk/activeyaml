# frozen_string_literal: true

require_relative 'yaml_hash'

module ActiveYaml
  # no doc
  module MethodMapper
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
