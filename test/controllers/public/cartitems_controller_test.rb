require "test_helper"

class Public::CartitemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_cartitems_index_url
    assert_response :success
  end
end
