require "test_helper"

class ArticleDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @user=users(:one)
    @article=articles(:one)
  end

  test "article delete link" do
    login_test2(@user)
    get articles_path
    assert_select "a[href=?]", article_path(@article)
  end
end
