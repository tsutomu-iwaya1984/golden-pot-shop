require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "shows the catalogue" do
    get products_url

    assert_response :success
    assert_select ".material-story", count: 3
  end

  test "filters products by material" do
    get products_url, params: { material: "金" }

    assert_response :success
    assert_select "h3", text: "金の大壺", count: 1
    assert_select "h3", text: "銀の小壺", count: 0
  end

  test "shows a product" do
    get product_url(@product)

    assert_response :success
    assert_select "a", /デモ購入フローへ/
  end
  test "combined filters retain their selected values and search query" do
    get products_url, params: { material: "金", size: "大", query: "金" }

    assert_response :success
    assert_select "select#material option[selected][value='金']", count: 1
    assert_select "select#size option[selected][value='大']", count: 1
    assert_select "input#query[value='金']", count: 1
    assert_select ".product-card", count: 1
    assert_select "h3", text: "金の大壺", count: 1
  end

  test "filters show the empty state without losing the selected conditions" do
    get products_url, params: { material: "銀", size: "大", query: "見つからない商品" }

    assert_response :success
    assert_select ".empty-state", count: 1
    assert_select "select#material option[selected][value='銀']", count: 1
    assert_select "select#size option[selected][value='大']", count: 1
  end
end
