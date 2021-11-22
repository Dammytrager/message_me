ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../config/environment", __dir__)
require 'rspec/rails'
require 'factory_girl_rails'
Dir[File.join(__dir__, 'support', '*.rb')].each { |file| require file }


RSpec.configure do |config|

  config.include ControllerMacros, type: :request

  # Allows for using named path
  config.include Rails.application.routes.url_helpers

  config.infer_spec_type_from_file_location!


end

