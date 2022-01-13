require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user=users(:one)
  end

  test "should get login_path" do
    get login_path
    assert_response :success
  end

  test "invalid login" do
    get login_path
    assert_template 'sessions/new'
    post login_path params: {
      session: {
        email: @user.email,
        password: "invalid"
      }
    }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "invalid login2" do
    get login_path
    assert_template 'sessions/new'
    post login_path params: {
      session: {
        email: "",
        password: "password"
      }
    }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "from valid login to logout" do
    get login_path
    post login_path params: {
      session: {
        email: @user.email,
        password: "password"
      }
    }
    assert is_login_test?
    assert_redirected_to root_url
    follow_redirect!
    delete logout_path
    assert_not is_login_test?
    assert_redirected_to root_url
  end
end
