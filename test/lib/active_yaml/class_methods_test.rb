# frozen_string_literal: true

require_relative '../../test_helper'

class SomeUser
  extend ActiveYaml::ClassMethods

  yaml 'test/examples/example.yaml'
end

module ActiveYaml
  class ClassMethodsTest < Minitest::Test
    # rubocop:disable Naming/VariableNumber
    def test_call_chain
      result_1 = SomeUser.start.kek.lol

      assert_equal 'text', result_1

      result_2 = SomeUser.start.kek.users.first

      assert_equal 'Kirill', result_2

      assert_kind_of Array, SomeUser.start.kek.users
    end
    # rubocop:enable Naming/VariableNumber

    def test_incomplete_call
      result = SomeUser.start.kek

      assert_kind_of ActiveYaml::YamlHash, result
    end

    def test_yaml_data
      expect_hash = { 'start' => { 'kek' => { 'lol' => 'text', 'cheburek' => 'cheburek',
                                              'users' => %w[Kirill Ekaterina] } } }

      assert_equal SomeUser.yaml_data, expect_hash
    end
  end
end
