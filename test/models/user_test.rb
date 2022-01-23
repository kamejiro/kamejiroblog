require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user=User.new(name: "example", email: "user@example.com",
      password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "user should be unique" do
    duplicate_user=@user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "user name should be present" do
    @user.name=""
    assert_not @user.valid?
  end

  test "user name should not be too long" do
    @user.name="a"*21
    assert_not @user.valid?
  end

  test "user email should be present" do
    @user.email=""
    assert_not @user.valid?
  end

  test "user email should meet format" do
    @user.email="invalid@invalid"
    assert_not @user.valid?
    @user.email="invalid.invalid"
    assert_not @user.valid?
  end

  test "user email should not be too long" do
    @user.email="a"*246 + "@gmail.com"
    assert_not @user.valid?
  end

  test "user password should be present" do
    @user.password=@user.password_confirmation=""
    assert_not @user.valid?
  end

  test "user password should not be too long" do
    @user.password=@user.password_confirmation="a"*5
    assert_not @user.valid?
  end

  test "admin should be false" do
    assert_not @user.admin
  end
end
