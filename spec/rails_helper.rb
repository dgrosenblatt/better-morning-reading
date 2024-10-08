ENV["RACK_ENV"] = "test"

require File.expand_path("../../config/environment", __FILE__)

if Rails.env.production?
  abort("The Rails environment is running in production mode!")
end

require "rspec/rails"
require "shoulda/matchers"

Dir[Rails.root.join("spec/support/**/*.rb")].sort.each { |file| require file }
Dir[Rails.root.join("lib/tasks/*.rb")].sort.each { |file| require file }

module SystemTestHelper
  # Extend this module in spec/support/system/*.rb
  include Formulaic::Dsl
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include SystemTestHelper, type: :system
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = true
end

ActiveRecord::Migration.maintain_test_schema!
