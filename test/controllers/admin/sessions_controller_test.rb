require "test_helper"

class Admin::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "successful login returns to the requested management page" do
    get admin_products_url
    assert_redirected_to admin_login_url
    post admin_login_url, params: { username: "admin", password: "golden-pot-local" }
    assert_redirected_to admin_products_url
    get admin_products_url
    assert_response :success
  end

  test "wrong credentials do not grant management access" do
    post admin_login_url, params: { username: "admin", password: "incorrect" }
    assert_response :unprocessable_entity
    get admin_dashboard_url
    assert_redirected_to admin_login_url
  end

  test "logout revokes access" do
    sign_in_admin
    delete admin_logout_url
    assert_redirected_to admin_login_url
    get admin_dashboard_url
    assert_redirected_to admin_login_url
  end

  test "anonymous updates and deletions leave products unchanged" do
    product = products(:one)
    original_name = product.name
    assert_no_difference("Product.count") do
      patch admin_product_url(product), params: { product: { name: "changed" } }
      assert_redirected_to admin_login_url
      delete admin_product_url(product)
      assert_redirected_to admin_login_url
    end
    assert_equal original_name, product.reload.name
  end
  test "head requests remember the requested management page" do
    head admin_products_url
    assert_redirected_to admin_login_url
    post admin_login_url, params: { username: "admin", password: "golden-pot-local" }
    assert_redirected_to admin_products_url
  end
end
