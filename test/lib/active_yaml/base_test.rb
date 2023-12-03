# frozen_string_literal: true

require_relative '../../test_helper'

class SomeUser < ActiveYaml::Base
  yaml '.examples/example.yaml'

  def some_method
    yaml.kek.lol
  end
end

module ActiveYaml
  class BaseTest < Minitest::Test
    def setup
      @user = SomeUser.new
    end

    # rubocop:disable Naming/VariableNumber
    def test_call_chain
      result_1 = @user.yaml.kek.lol

      assert_equal 'text', result_1

      result_2 = @user.yaml.kek.users.first

      assert_equal '1', result_2
    end
    # rubocop:enable Naming/VariableNumber

    def test_some_method
      assert_equal 'text', @user.some_method
    end

    def test_incomplete_call
      result = @user.yaml.kek

      assert result.is_a?(ActiveYaml::YamlHash)
    end

    def test_yaml_data
      expect_hash = { 'yaml' => { 'kek' => { 'lol' => 'text', 'cheburek' => 'cheburek',
                                             'users' => { 'first' => '1' } } } }

      assert_equal @user.yaml_data, expect_hash
    end
  end
end
