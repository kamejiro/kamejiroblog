require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  def setup
    @article=Article.new(title: "Example article", content: "content")
  end

  test "title should be present" do
    @article.title=""
    assert_not @article.valid?
  end

  test "content should be present" do
    @article.content=""
    assert_not @article.valid?
  end

  test "article should be unique" do
    duplicate_article=@article.dup
    @article.save
    assert_not duplicate_article.valid?
  end

  test "title should not be too long" do
    @article.title="a"*101
    assert_not @article.valid?
  end
end
