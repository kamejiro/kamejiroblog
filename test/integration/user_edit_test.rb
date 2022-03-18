require "test_helper"

class UserEditTest < ActionDispatch::IntegrationTest
  def setup
    @user=users(:one)
  end

  test "should get user form" do
    login_test2(@user)
    get edit_user_path(@user)
    assert_select 'form input[value="testuser"]'
    assert_select 'form input[value="example@gmail.com"]'
    assert_select 'form input[type="password"]', count: 2
    assert_select 'form input[type="submit"]'
  end
end
