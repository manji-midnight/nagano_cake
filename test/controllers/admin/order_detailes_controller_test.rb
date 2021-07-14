require 'test_helper'

class Admin::OrderDetailesControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admin_order_detailes_update_url
    assert_response :success
  end

end
