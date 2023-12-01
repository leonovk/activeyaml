# Active Yaml - model interfaces for yaml files

[![Build Status](https://github.com/leonovk/activeyaml/actions/workflows/ruby.yml/badge.svg)](https://github.com/leonovk/activeyaml/actions/workflows/ruby.yml) ![Gem](https://img.shields.io/gem/dt/activeyaml) [![Gem Version](https://badge.fury.io/rb/activeyaml.svg)](https://badge.fury.io/rb/activeyaml)

Framework that allows you to use model classes for mapping Yaml files.

### Installation

```ruby
gem 'activeyaml'
```
And then execute:

```bundle install```

Or install it yourself as:

```gem install activeyaml```

Require if necessary:

```ruby
require 'active_yaml'
```
### Usage with model

You can create models that will take data from your Yaml files. Suppose you have the following Yaml file: `examples/example.yaml`. With the following content:

```yaml
yaml:
  kek:
    lol: 'text'
    cheburek: 'cheburek'
    users:
      first: '1'
```
(This and all subsequent examples will use this yaml file)

Then, you could do the following:

```ruby
require 'active_yaml'

class User < ActiveYaml::Base
  yaml 'examples/example.yaml'
end
```
You can then create instances of your model and use call chains to retrieve data from the Yaml file.

```ruby
user = User.new
user.yaml.kek.lol # output: 'text'
user.yaml.kek.users.first # output: '1'
```
If you complete the chain not to the final value. You will get an object like a hash. It won't respond to []. However, you can use a dot to go through the values further. You can also use data from Yaml files inside your model.

```ruby
class User < ActiveYaml::Base
  yaml 'examples/example.yaml'

  # The method will return "text"
  def test_method
    yaml.kek.lol
  end
end
```

### Usage without model
You also don't have to create models to use this framework. After that, an object will be instantiated in the user variable, allowing chains of calls to be made. To do this you can do the following:

```ruby
user = ActiveYaml.create('examples/example.yaml')
user.yaml.kek.lol # output: 'text'
```

### Contribution

If you would like to contribute to the development, submit a pull request with your changes. We welcome any contributions that improve the service. You can also view the current project board here.  You can also contribute by reporting bugs or suggesting new features. Please use the GitHub issues for that.
