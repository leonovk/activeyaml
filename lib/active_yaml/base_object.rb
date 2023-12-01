# frozen_string_literal: true

module ActiveYaml
  # base doc
  class BaseObject
    attr_reader :hash

    def initialize(hash)
      @hash = hash
    end

    def method_missing(method, *args, &block)
      method_name = method.to_s
      if hash.key?(method_name)
        value = hash[method_name]
        return BaseObject.new(value) if value.is_a?(Hash)

        value
      else
        super
      end
    end

    def respond_to_missing?(method, include_private = false)
      @hash.key?(method.to_s) || super
    end

    def inspect
      hash
    end
  end
end
