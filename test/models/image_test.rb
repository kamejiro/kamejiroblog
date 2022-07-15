require "test_helper"

class ImageTest < ActiveSupport::TestCase
  def setup
    @image=Image.new
  end

  test "image should be valid size" do
    @image.image=Rack::Test::UploadedFile.new(Rails.root.join("test/fixtures/files/10MB.png"), "image/png")
    assert_not @image.valid?
  end

  test "image should be valid content_type" do
    @image.image=Rack::Test::UploadedFile.new(Rails.root.join("test/fixtures/files/kitten.txt"))
    assert_not @image.valid?
  end
end
