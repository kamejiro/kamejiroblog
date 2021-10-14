require "test_helper"

class LayoutTest < ActionDispatch::IntegrationTest
  test "layout links without login" do
    get root_url
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", rules_path
    assert_select "a[href=?]", about_path
  end
end
