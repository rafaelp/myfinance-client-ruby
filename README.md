# myfinance-client-ruby

A Ruby client for the Myfinance REST API

![https://rubygems.org/gems/myfinance-client](https://badge.fury.io/rb/myfinance-client.png)
![https://travis-ci.org/myfreecomm/myfinance-client-ruby](https://travis-ci.org/myfreecomm/myfinance-client-ruby.png?branch=master)
![https://coveralls.io/r/myfreecomm/myfinance-client-ruby](https://coveralls.io/repos/myfreecomm/myfinance-client-ruby/badge.png?branch=master)
![https://codeclimate.com/github/myfreecomm/myfinance-client-ruby](https://codeclimate.com/github/myfreecomm/myfinance-client-ruby.png)

Myfinance API docs: https://app.myfinance.com.br/docs/api

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'myfinance'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install myfinance

## Usage

##### Given your token, create an instance of Myfinance::Client, as below:

```ruby
client = Myfinance.client("YOUR_TOKEN_HERE")
```

##### Now you have access to every API endpoint:

* [Entities API](https://app.myfinance.com.br/docs/api/entities) as `client.entities`

### Endpoints

#### [Entities](https://app.myfinance.com.br/docs/api/entities)

<table>
  <tr>
    <th>HTTP method</th>
    <th>Endpoint</th>
    <th>Client method</th>
  </tr>
  <tr>
    <td><code>GET</code></td>
    <td>
      <a href="https://app.myfinance.com.br/docs/api/entities#get_index" target="_blank">
        /entities
      </a>
    </td>
    <td>
      <code>client.emitters.find_all</code>
    </td>
  </tr>
  <tr>
    <td><code>GET</code></td>
    <td>
      <a href="https://app.myfinance.com.br/docs/api/entities#get_show" target="_blank">
        /entities/:id
      </a>
    </td>
    <td>
      <code>client.emitters.find</code>
    </td>
  </tr>
</table>

### Configuration

```ruby
require 'myfinance'

Myfinance.configure do |m|
  m.url = 'https://sandbox.myfinance.com.br' # defaults to 'https://app.myfinance.com.br' if omitted
  c.user_agent = 'My App v1.0' # optional, but you should pass a custom user-agent identifying your app
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/myfinance. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

