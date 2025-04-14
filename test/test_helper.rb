ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

# Only run in local test environment, not in CI
local_environment = !ENV["CI"]

if Rails.env.test? && local_environment
  # Ensure application_system_test_case.rb is required
  require_relative "application_system_test_case" if File.exist?(File.join(Rails.root, "test", "application_system_test_case.rb"))
end
