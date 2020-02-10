require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get all_gossips" do
    get home_all_gossips_url
    assert_response :success
  end

end
