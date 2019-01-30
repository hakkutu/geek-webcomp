require 'test_helper'

class ArtistFavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get artist_favorites_create_url
    assert_response :success
  end

  test "should get destroy" do
    get artist_favorites_destroy_url
    assert_response :success
  end

end
