require "test_helper"

class ArticleTemplateTest < ActiveSupport::TestCase
  def setup
    @article_template=ArticleTemplate.new(title: "Example article", abstract: "abstract", content: "content")
  end

  test "title should be present" do
    @article_template.title=""
    assert_not @article_template.valid?
  end

  test "title should not be too long" do
    @article_template.title="a"*101
    assert_not @article_template.valid?
  end

  test "abstract should be present" do
    @article_template.abstract=""
    assert_not @article_template.valid?
  end

  test "content should be present" do
    @article_template.content=""
    assert_not @article_template.valid?
  end
end
