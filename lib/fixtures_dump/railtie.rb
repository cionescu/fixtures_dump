require 'fixtures_dump'
require 'rails'
module FixturesDump
  class Railtie < Rails::Railtie
    railtie_name :db_fixtures_dump

    rake_tasks do
      load "tasks/fixtures_dump.rake"
    end
  end
end
