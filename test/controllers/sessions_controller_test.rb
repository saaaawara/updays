require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get api_v1_login_path
    assert_response :success
  end

  # test "should post create" do
  #   post api_v1_login_path, params: { user: { } }, as: :json
  #   assert_response 204
  # end

  

end
