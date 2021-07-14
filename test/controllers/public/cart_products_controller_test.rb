require 'test_helper'

class Public::CartProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_cart_products_new_url
    assert_response :success
  end

  test "should get create" do
    get public_cart_products_create_url
    assert_response :success
  end

end
