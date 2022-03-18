require "test_helper"

class LoginTest < ActionDispatch::IntegrationTest
  test "should get login form" do
    get signup_path
    assert_select 'form input#user_email[type="text"]'
    assert_select 'form input[type="password"]'
    assert_select 'form input[type="submit"]'
    assert_select "a[href=?]", signup_path
  end
end
