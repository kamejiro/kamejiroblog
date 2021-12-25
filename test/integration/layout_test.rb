require "test_helper"

class LayoutTest < ActionDispatch::IntegrationTest
  def setup
    @category=categorys(:one)
  end
  test "layout links without login" do
    get root_url
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", rules_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", others_path
    assert_select "a[href=?]", new_path
    assert_select "a[href=?]", category_path(@category), count: 2
  end
end
