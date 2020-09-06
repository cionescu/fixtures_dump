require "fixtures_dump/version"
require "fixtures_dump/helpers"

module FixturesDump
  require 'fixtures_dump/railtie' if defined?(Rails)
end
