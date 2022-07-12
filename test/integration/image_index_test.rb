require "test_helper"

class ImageIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user=users(:one)
  end
  
  test "should get article form" do
    login_test2(@user)
    image=fixture_file_upload('test/fixtures/files/kitten.jpg', 'image/jpeg')
    post images_path, params:{
      image:{
        image: image
      }
    }
    @image=Image.first
    get images_path
    assert_select "img", 2
    assert_select "a", text: "削除"
  end
end
