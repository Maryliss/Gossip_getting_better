require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get connection" do
    get static_pages_connection_url
    assert_response :success
  end

end
