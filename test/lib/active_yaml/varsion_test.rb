# frozen_string_literal: true

require_relative '../../test_helper'

module ActiveYaml
  class VersionTest < Minitest::Test
    def test_version
      refute_nil VERSION
    end
  end
end
