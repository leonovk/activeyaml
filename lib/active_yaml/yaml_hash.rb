# frozen_string_literal: true

module ActiveYaml
  # Class for creating hashes of similar objects
  class YamlHash
    def initialize(hash)
      @hash = hash
    end

    def method_missing(method, *args, &block)
      value = hash[method.to_s]

      if value
        return self.class.new(value) if value.is_a?(Hash)

        value
      else
        super
      end
    end

    def inspect
      hash
    end

    def to_s
      hash.to_s
    end

    def respond_to_missing?(method, include_private = false)
      hash.key?(method.to_s) || super
    end

    private

    attr_reader :hash
  end
end
