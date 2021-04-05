require "test_helper"

class InstructorsControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get instructors_profile_url
    assert_response :success
  end
end
