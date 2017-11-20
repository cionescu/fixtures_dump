# Inspired by https://gist.github.com/kuboon/55d4d8e862362d30456e7aa7cd6c9cf5

namespace 'db:fixtures' do
  desc "generate fixtures from the current database"

  task :dump => :environment do
    Rails.application.eager_load!
    models = defined?(ApplicationRecord) ? ApplicationRecord.descendants : ActiveRecord::Base.descendants
    dump_dir = ENV.fetch('FIXTURES_PATH', 'test/fixtures')
    excluded = ENV.fetch('EXCLUDED', []).split(' ')
    required = ENV.fetch('REQUIRED', []).split(' ')
    puts "Found #{models.count} models: #{models.map(&:to_s)}"
    puts "Required models: #{required.join(", ")}"
    puts "Excluded models: #{excluded.join(", ")}"

    models_to_dump = required.any? ? required.map(&:constantize) : models
    models_to_dump.each do |model|
      puts "exporting: #{model.to_s}"

      filepath = Rails.root.join(dump_dir, "#{model.to_s.underscore.pluralize}.yml")
      FileUtils.mkdir_p filepath.dirname

      filepath.open('w') do |file|
        hash = {}
        model.find_each do |r|
          key = if r.respond_to?(:immutable_name)
            r.immutable_name
          elsif r.respond_to?(:name)
            r.name
          else
            "#{model.to_s.underscore}_#{r.id}"
          end
          attributes = r.attributes.except(:password_digest).delete_if{|k,v| v.nil?}
          hash[key] = attributes
        end
        file.write hash.to_yaml
      end
    end
  end
end
