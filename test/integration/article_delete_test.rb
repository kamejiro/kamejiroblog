require "test_helper"

class ArticleDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @article=articles(:one)
  end

  test "article delete link" do
    get root_path
    assert_select "a[href=?]", articles_path
    get articles_path
    assert_select "a[href=?]", article_path(@article)
  end
end
