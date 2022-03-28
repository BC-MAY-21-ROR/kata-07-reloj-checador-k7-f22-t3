require "test_helper"

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get reports_show_url
    assert_response :success
  end

  test "should get pinga" do
    get reports_pinga_url
    assert_response :success
  end
end
