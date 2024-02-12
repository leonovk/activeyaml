# frozen_string_literal: true

module ActiveYaml
  # Class for creating hashes of similar objects
  class YamlHash
    def initialize(hash)
      @hash = hash || {}
    end

    # The method is used to obtain a hash from an incomplete call chain.
    # By default, if there is a value from a method of the same name, it will be returned.
    # Otherwise the current hash will be returned
    def hash
      @hash['hash'] || @hash
    end

    # The main logic of this class is implemented in this method.
    # Allows you to filter method calls and redirect them to a hash by key
    def method_missing(method, *args, &block)
      value = @hash[method.to_s]

      if value
        return self.class.new(value) if value.is_a?(Hash)

        value
      else
        super
      end
    end

    def respond_to_missing?(method, include_private = false)
      @hash.key?(method.to_s) || super
    end

    def inspect
      @hash
    end

    def to_s
      @hash.to_s
    end
  end
end
