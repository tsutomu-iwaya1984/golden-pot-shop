require "test_helper"

class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    sign_in_admin
    get admin_dashboard_url
    assert_response :success
  end

  test "requires authentication" do
    get admin_dashboard_url
    assert_redirected_to admin_login_url
  end
end
