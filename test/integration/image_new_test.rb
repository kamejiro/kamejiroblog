require "test_helper"

class ImageNewTest < ActionDispatch::IntegrationTest
  def setup
    @user=users(:one)
  end

  test "should get image form" do
    login_test2(@user)
    get upload_path
    assert_select 'form input[type="file"]'
    assert_select 'form input[type="submit"]'
  end
end
