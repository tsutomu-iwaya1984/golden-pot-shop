ENV["RAILS_ENV"] ||= "test"
ENV["ADMIN_USERNAME"] = "test-admin"
ENV["ADMIN_PASSWORD"] = "test-only-password"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    def admin_auth_headers
      { "HTTP_AUTHORIZATION" => ActionController::HttpAuthentication::Basic.encode_credentials("test-admin", "test-only-password") }
    end

    # Add more helper methods to be used by all tests here...
  end
end
