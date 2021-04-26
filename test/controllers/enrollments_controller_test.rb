require "test_helper"

class EnrollmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get enroll" do
    get enrollments_enroll_url
    assert_response :success
  end

  test "should get cancel" do
    get enrollments_cancel_url
    assert_response :success
  end

  test "should get get_by_trainee" do
    get enrollments_get_by_trainee_url
    assert_response :success
  end

  test "should get get_by_slot" do
    get enrollments_get_by_slot_url
    assert_response :success
  end
end
