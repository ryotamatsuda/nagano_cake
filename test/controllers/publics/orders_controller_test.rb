require 'test_helper'

class Publics::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publics_orders_index_url
    assert_response :success
  end

  test "should get new" do
    get publics_orders_new_url
    assert_response :success
  end

  test "should get create" do
    get publics_orders_create_url
    assert_response :success
  end

end
