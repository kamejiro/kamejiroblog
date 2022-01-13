require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user=users(:one)
  end

  test "should get signup" do
    get signup_path
    assert_response :success
  end

  test "invalid post user" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path params: {
        user: {
          name: "",
          email: "test@invalid",
          password: "foo",
          password_confirmation: "bar"
        }
      }
    end
    assert_template 'users/signup'
    assert_select 'div#error_explanation'
    assert_select 'div.alert'
    assert_select 'div.alert-danger'
  end

  test "valid post user" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path params: {
        user: {
          name: "testuser",
          email: "test@example.com",
          password: "foobar",
          password_confirmation: "foobar"
        }
      }
    end
    assert_redirected_to root_url
    assert_not flash.empty?
  end
  
  test "should get index" do
    login_test(@user)
    get users_path
    assert_response :success
  end

  test "invalid delete user without login" do
    get users_path
    assert_not flash.empty?
    assert_redirected_to login_url
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
  end

  test "valid delete user" do
    login_test(@user)
    get users_path
    assert_difference 'User.count', -1 do
      delete user_path(@user)
    end
    assert_redirected_to users_url
    assert_not flash.empty?
  end

  test "invalid edit user without login" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should get edit" do
    login_test(@user)
    get edit_user_path(@user)
    assert_response :success
  end

  # test "invalid edit user" do
  #   get edit_user_path(@user)
  #   assert_template 'users/edit'
  #   patch user_path(@user) params{user:{name:"testuser",email:"test@example.com",password:"foobar",password_confirmation:"foobar"}}
  #   assert_template 'users/edit'
  #   assert_select "div.alert", "The form contains 4 errors"
  # end

  # test "valid edit user" do
  #   get edit_user_path(@user)
  #   assert_template 'users/edit'
  #   patch user_path(@user) params{user:{name:"testuser",email:"test@example.com",password:"foobar",password_confirmation:"foobar"}}
  #   assert_redirected_to users_url
  #   assert_not flash.empty?
  #   @user.reload
  #   assert_equal name, @user.name
  #   assert_equal email, @user.email
  # end
end
