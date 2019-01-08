require 'test_helper'

class CartCdsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cart_cds_new_url
    assert_response :success
  end

  test "should get create" do
    get cart_cds_create_url
    assert_response :success
  end

  test "should get destroy" do
    get cart_cds_destroy_url
    assert_response :success
  end

end
