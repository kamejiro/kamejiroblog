require "test_helper"

class ArticleShowTest < ActionDispatch::IntegrationTest
  def setup
    @article=articles(:one)
  end

  test "article display" do
    get article_path(@article)
    assert_select "div#breadcrumb"
    assert_match @article.title.to_s, response.body
    assert_match @article.created_at.strftime('%Y/%m/%d').to_s, response.body
    assert_match @article.content.to_s, response.body
  end

  # test "should be inclement if get request" do
  #   assert_difference '@article.impressions_count', 1 do
  #     get article_path(@article)
  #   end
  # end
end
