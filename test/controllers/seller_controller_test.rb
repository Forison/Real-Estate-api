require 'test_helper'

class SellerControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get seller_show_url
    assert_response :success
  end
end
