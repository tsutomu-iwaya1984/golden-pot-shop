require "test_helper"

class AdminAccessTest < ActionDispatch::IntegrationTest
  test "public product pages remain accessible without authentication" do
    get products_url
    assert_response :success
    get product_url(products(:one))
    assert_response :success
  end

  test "management and edit forms require authentication" do
    [ admin_dashboard_index_url, admin_products_index_url, new_product_url, edit_product_url(products(:one)) ].each do |url|
      get url
      assert_response :unauthorized
    end
  end

  test "anonymous visitors cannot create update or delete products" do
    product = products(:one)
    original_name = product.name
    assert_no_difference("Product.count") do
      post products_url, params: { product: { name: "changed" } }
      assert_response :unauthorized
      patch product_url(product), params: { product: { name: "changed" } }
      assert_response :unauthorized
      delete product_url(product)
      assert_response :unauthorized
    end
    assert_equal original_name, product.reload.name
  end

  test "invalid products are rejected even for authenticated administrators" do
    assert_no_difference("Product.count") do
      post products_url, headers: admin_auth_headers, params: { product: { name: "壺", material: "木", size: "大", price: -1, description: "説明" } }
      assert_response :unprocessable_content
    end
  end
end
