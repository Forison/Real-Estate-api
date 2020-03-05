# frozen_string_literal: true

require 'test_helper'

class SellersControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get sellers_show_url
    assert_response :success
  end
end
