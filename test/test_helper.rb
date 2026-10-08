ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    def sign_in_admin
      post admin_login_url, params: { username: "admin", password: "golden-pot-local" }
      assert_redirected_to admin_dashboard_url
    end

    # Add more helper methods to be used by all tests here...
  end
end
