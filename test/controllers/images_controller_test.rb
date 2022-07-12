require "test_helper"

class ImagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user=users(:one)
    @user2=users(:two)
    image=fixture_file_upload('test/fixtures/files/kitten.jpg', 'image/jpeg')
    post images_path, params:{
      image:{
        image: image
      }
    }
    @image=Image.first
  end

  test "should get new" do
    login_test(@user)
    get upload_url
    assert_response :success
  end

  test "should get index" do
    login_test(@user)
    image=fixture_file_upload('test/fixtures/files/kitten.jpg', 'image/jpeg')
    get images_url
    assert_response :success
  end

  test "invalid get new without admin" do
    get upload_url
    assert_not flash.empty?
    assert_redirected_to login_url

    login_test(@user2)
    get upload_url
    assert_redirected_to root_url
  end

  test "invalid get index without admin" do
    get images_url
    assert_not flash.empty?
    assert_redirected_to login_url

    login_test(@user2)
    get images_url
    assert_redirected_to root_url
  end

  test "valid post image" do
    login_test(@user)
    image=fixture_file_upload('test/fixtures/files/kitten.jpg', 'image/jpeg')
    get upload_url
    assert_select 'input[type="file"]'
    assert_difference 'Image.count', 1 do
      post images_path, params:{
        image:{
          image: image
        }
      }
    end
  end

  test "invalid post image without admin" do
    image=fixture_file_upload('test/fixtures/files/kitten.jpg', 'image/jpeg')
    assert_no_difference 'Image.count' do
      post images_path, params:{
        image:{
          image: image
        }
      }
    end
    login_test(@user2)
    assert_no_difference 'Image.count' do
      post images_path, params:{
        image:{
          image: image
        }
      }
    end
  end

  test "invalid delete image without login" do
    login_test(@user)
    image=fixture_file_upload('test/fixtures/files/kitten.jpg', 'image/jpeg')
    post images_path, params:{
      image:{
        image: image
      }
    }
    @image=Image.first
    delete logout_path
    assert_no_difference 'Image.count' do
      delete image_path(@image)
    end
  end

  test "invalid delete image without admin" do
    login_test(@user)
    image=fixture_file_upload('test/fixtures/files/kitten.jpg', 'image/jpeg')
    post images_path, params:{
      image:{
        image: image
      }
    }
    @image=Image.first
    delete logout_path
    login_test(@user2)
    assert_no_difference 'Image.count' do
      delete image_path(@image)
    end
  end

  test "valid delete image" do
    login_test(@user)
    image=fixture_file_upload('test/fixtures/files/kitten.jpg', 'image/jpeg')
    post images_path, params:{
      image:{
        image: image
      }
    }
    @image=Image.first
    assert_difference 'Image.count', -1 do
      delete image_path(@image)
    end
    assert_redirected_to images_url
    assert_not flash.empty?
  end
end
