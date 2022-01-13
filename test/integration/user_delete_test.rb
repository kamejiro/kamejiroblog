require "test_helper"

class UserDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @user=users(:one)
  end

  test "user delete link" do
    login_test2(@user)
    get users_path
    assert_select "a[href=?]", user_path(@user)
  end
end
