module FixturesDump
  module Helpers
    extend self

    def record_key record, model
      key = if record.respond_to?(:immutable_name)
        record.immutable_name
      elsif record.respond_to?(:name)
        record.name
      else
        "#{model.to_s.underscore}_#{record.id}"
      end
      underscore_key key
    end

    private

    def underscore_key key
      key.underscore.gsub(/ /, '_')
    end
  end
end
