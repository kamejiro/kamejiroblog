require "test_helper"

class UserIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user=users(:one)
  end

  test "user delete link" do
    login_test2(@user)
    get users_path
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", edit_user_path(@user)
  end
end
