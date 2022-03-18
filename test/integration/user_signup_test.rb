require "test_helper"

class UserSignupTest < ActionDispatch::IntegrationTest
  test "should get signup form" do
    get signup_path
    assert_select 'form input#user_name[type="text"]'
    assert_select 'form input#user_email[type="text"]'
    assert_select 'form input[type="password"]', count: 2
    assert_select 'form input[type="submit"]'
  end
end
