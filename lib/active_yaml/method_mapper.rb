# frozen_string_literal: true

require_relative 'base_object'

module ActiveYaml
  # base mapper
  class MethodMapper
    def method_missing(method, *args, &block)
      method_name = method.to_s
      if yaml_data[method_name]
        value = yaml_data[method_name]
        return value unless value.is_a?(Hash)

        BaseObject.new(value)
      else
        super
      end
    end

    def respond_to_missing?(method, include_private = false)
      yaml_data[method.to_s] || super
    end
  end
end
