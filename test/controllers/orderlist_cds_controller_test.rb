require 'test_helper'

class OrderlistCdsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get orderlist_cds_create_url
    assert_response :success
  end

end
