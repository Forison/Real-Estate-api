require 'test_helper'

class GetUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get get_users_index_url
    assert_response :success
  end

end
