# frozen_string_literal: true

module ActiveYaml
  # Class for creating hashes of similar objects
  class YamlHash
    attr_reader :hash

    def initialize(hash)
      @hash = hash || {}
    end

    # The main logic of this class is implemented in this method.
    # Allows you to filter method calls and redirect them to a hash by key
    def method_missing(method, *args, &)
      value = hash[method.to_s]

      if value
        return self.class.new(value) if value.is_a?(Hash)

        value
      else
        super
      end
    end

    def respond_to_missing?(method, include_private = false)
      hash.key?(method.to_s) || super
    end

    def inspect
      hash
    end

    def to_s
      hash.to_s
    end
  end
end
