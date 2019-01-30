require 'test_helper'

class UserCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_comments_create_url
    assert_response :success
  end

end
