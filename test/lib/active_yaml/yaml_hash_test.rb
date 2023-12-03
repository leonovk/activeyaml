# frozen_string_literal: true

require_relative '../../test_helper'

module ActiveYaml
  class YamlHashTest < Minitest::Test
    def setup
      @hash = {
        'key1' => {
          'key2' =>
            {
              'key3' => 'value1',
              'key4' => 'vaalue2'
            }
        }
      }

      @yaml_hash = YamlHash.new(@hash)
    end

    def test_hash
      assert_equal @yaml_hash.hash, @hash
    end

    def test_call_chain
      result = @yaml_hash.key1.key2.key3

      assert_equal 'value1', result
    end

    def test_not_full_call_chain
      result = @yaml_hash.key1.key2

      assert result.is_a?(ActiveYaml::YamlHash)
    end
  end
end
