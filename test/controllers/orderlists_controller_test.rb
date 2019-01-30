require 'test_helper'

class OrderlistsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get orderlists_create_url
    assert_response :success
  end

end
