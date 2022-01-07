require "test_helper"

class UserDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @user=users(:one)
  end

  test "user delete link" do
    get root_path
    assert_select "a[href=?]", users_path
    get users_path
    assert_select "a[href=?]", user_path(@user)
  end
end
