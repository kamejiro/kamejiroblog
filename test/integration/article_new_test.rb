require "test_helper"

class ArticleNewTest < ActionDispatch::IntegrationTest
  def setup
    @user=users(:one)
  end

  test "should get article form" do
    login_test2(@user)
    get new_path
    assert_select 'form input[type="text"]'
    assert_select "form select#article_category_id"
    assert_select "form textarea#article_abstract"
    assert_select "form textarea#article_content"
    assert_select 'form input[type="submit"]'
  end
end
