# frozen_string_literal: true

require_relative '../../test_helper'

module ActiveYaml
  class YamlHashTest < Minitest::Test
    def setup # rubocop:disable Metrics/MethodLength
      @hash = {
        'key1' => {
          'key2' =>
            {
              'key3' => 'value1',
              'key4' => 'value2',
              'hash' => %w[el1 el2]
            },
          'key8' => {
            'hash' => {
              'key5' => 'value3'
            }
          },
          'hash' => 'hash_value'
        },
        'key6' => {
          'key7' => 'value4'
        }
      }

      @yaml_hash = YamlHash.new(@hash)
    end

    def test_hash
      assert_equal @yaml_hash.hash, @hash

      assert @yaml_hash.hash.is_a?(Hash)
    end

    def test_call_chain_hash
      result = @yaml_hash.key6.hash

      assert_equal result, @hash['key6']

      assert result.is_a?(Hash)
    end

    def test_call_chain
      result = @yaml_hash.key1.key2.key3

      assert_equal 'value1', result
    end

    def test_not_full_call_chain
      result = @yaml_hash.key1.key2

      assert result.is_a?(ActiveYaml::YamlHash)
    end

    def test_when_hash_is_value
      result = @yaml_hash.key1.hash

      assert_equal 'hash_value', result
    end

    def test_when_hash_is_hash
      result = @yaml_hash.key1.key8.hash

      assert_equal result, @hash['key1']['key8']['hash']

      assert result.is_a?(Hash)
    end

    def test_when_hash_is_array
      result = @yaml_hash.key1.key2.hash

      assert_equal result, @hash['key1']['key2']['hash']

      assert result.is_a?(Array)
    end
  end
end
