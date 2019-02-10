require 'test_helper'

class ArtistEveryoneControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get artist_everyone_index_url
    assert_response :success
  end

  test "should get show" do
    get artist_everyone_show_url
    assert_response :success
  end

end
