# FixturesDump

A rake task to allow exporting the current database as fixture files (in the Yaml format).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fixtures_dump'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fixtures_dump

## Usage

### General usage:

    bundle exec rake db:fixtures:dump

It defaults to using _'test/fixtures'_ as the fixture folder. This can be customized with the environmental variable _FIXTURES_PATH_

    FIXTURES_PATH=spec/fixtures bundle exec rake db:fixtures:dump

You can either dump all models (with no configuration), or you can whitelist the desired models with the _REQUIRED_ environmental variable.

    REQUIRED=RequiredModel bundle exec rake db:fixtures:dump

You can also download all the models that descend from _ActiveRecord::Base.descendants_ except for some:

    EXCLUDED=ExcludeThis bundle exec rake db:fixtures:dump

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cionescu/fixtures_dump. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the FixturesDump project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/cionescu/fixtures_dump/blob/master/CODE_OF_CONDUCT.md).
