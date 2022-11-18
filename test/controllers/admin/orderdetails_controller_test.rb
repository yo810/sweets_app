require "test_helper"

class Admin::OrderdetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_orderdetails_show_url
    assert_response :success
  end
end
