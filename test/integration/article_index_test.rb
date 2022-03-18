require "test_helper"

class ArticleIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user=users(:one)
    @article=articles(:one)
  end

  test "should get article form" do
    login_test2(@user)
    get articles_path
    assert_select "a[href=?]", article_path(@article), count: 2
    assert_select "a[href=?]", edit_article_path(@article)
  end
end
