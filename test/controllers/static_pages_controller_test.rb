require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
  end

  test "should get about" do
    get about_path
    assert_response :success
  end

  test "should get rules" do
    get rules_path
    assert_response :success
  end

  test "should get others" do
    get others_path
    assert_response :success
  end
end
