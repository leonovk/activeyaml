# frozen_string_literal: true

require_relative 'parser'
require_relative 'yaml_hash'

module ActiveYaml
  # A module with methods that allows you,
  # to work with Yaml files without creating models.
  module FactoryHash
    def create(file_path)
      hash = Parser.parse(file_path)
      YamlHash.new(hash)
    end
  end
end
