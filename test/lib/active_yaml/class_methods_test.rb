# frozen_string_literal: true

require_relative '../../test_helper'

class SomeUser
  extend ActiveYaml::ClassMethods
  yaml '.examples/example.yaml'
end

module ActiveYaml
  class ClassMethodsTest < Minitest::Test
    # rubocop:disable Naming/VariableNumber
    def test_call_chain
      result_1 = SomeUser.start.kek.lol

      assert_equal 'text', result_1

      result_2 = SomeUser.start.kek.users.first

      assert_equal '1', result_2
    end
    # rubocop:enable Naming/VariableNumber

    def test_incomplete_call
      result = SomeUser.start.kek

      assert result.is_a?(ActiveYaml::YamlHash)
    end

    def test_yaml_data
      expect_hash = { 'start' => { 'kek' => { 'lol' => 'text', 'cheburek' => 'cheburek',
                                              'users' => { 'first' => '1' } } } }

      assert_equal SomeUser.yaml_data, expect_hash
    end
  end
end
