require "test_helper"

class ArticleEditTest < ActionDispatch::IntegrationTest
  def setup
    @user=users(:one)
    @article=articles(:one)
  end

  test "should get article form" do
    login_test2(@user)
    get edit_article_path(@article)
    assert_select 'form input[type=radio]'
    assert_select 'form input[value="テストタイトルです。"]'
    assert_select "form select#article_category_id"
    assert_select "form textarea#article_abstract"
    assert_select "form textarea#article_content"
    assert_select 'form input[type="submit"]'
  end
end
