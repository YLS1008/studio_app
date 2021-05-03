require "test_helper"

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get payments_index_url
    assert_response :success
  end

  test "should get pay" do
    get payments_pay_url
    assert_response :success
  end

  test "should get refund" do
    get payments_refund_url
    assert_response :success
  end
end
