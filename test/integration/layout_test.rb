require "test_helper"

class LayoutTest < ActionDispatch::IntegrationTest
  def setup
    @user=users(:one)
    @user2=users(:two)
    @category=categorys(:one)
  end
  test "layout links without login" do
    get root_url
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", category_path(@category), count: 2
    assert_select "a[href=?]", others_path
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", rules_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", new_path, count: 0
    assert_select "a[href=?]", articles_path, count: 0
    assert_select "a[href=?]", edit_user_path(@user), count: 0
    assert_select "a[href=?]", users_path, count: 0
  end

  test "layout links with login" do
    login_test2(@user2)
    get root_url
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", category_path(@category), count: 2
    assert_select "a[href=?]", others_path
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", edit_user_path(@user)
    assert_select "a[href=?]", users_path, count: 0
    assert_select "a[href=?]", new_path, count: 0
    assert_select "a[href=?]", articles_path, count: 0
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", signup_path, count: 0
  end

  test "layout links with admin" do
    login_test2(@user)
    get root_url
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", category_path(@category), count: 2
    assert_select "a[href=?]", others_path
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", edit_user_path(@user)
    assert_select "a[href=?]", users_path
    assert_select "a[href=?]", new_path
    assert_select "a[href=?]", articles_path
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", signup_path, count: 0
  end
end
