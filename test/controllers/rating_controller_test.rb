require 'test_helper'

class RatingControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get rating_create_url
    assert_response :success
  end

  test "should get edit" do
    get rating_edit_url
    assert_response :success
  end

  test "should get delete" do
    get rating_delete_url
    assert_response :success
  end

end
