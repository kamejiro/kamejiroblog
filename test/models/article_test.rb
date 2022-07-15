require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  def setup
    @category=categorys(:one)
    @article=@category.articles.build(title: "Example article", abstract: "abstract", content: "content")
  end

  test "article should be unique" do
    duplicate_article=@article.dup
    @article.save
    assert_not duplicate_article.valid?
  end

  test "title should be present" do
    @article.title=""
    assert_not @article.valid?
  end

  test "title should not be too long" do
    @article.title="a"*101
    assert_not @article.valid?
  end

  test "abstract should be present" do
    @article.abstract=""
    assert_not @article.valid?
  end

  test "category_id should be present" do
    @article.category_id=""
    assert_not @article.valid?
  end

  test "content should be present" do
    @article.content=""
    assert_not @article.valid?
  end

  test "article thumbnail should be valid" do
    @article.image=Rack::Test::UploadedFile.new(Rails.root.join("test/fixtures/files/books_thum_150.jpg"), "image/jpeg")
    assert @article.valid?
  end

  test "article thumbnail should be valid size" do
    @article.image=Rack::Test::UploadedFile.new(Rails.root.join("test/fixtures/files/10MB.png"), "image/png")
    assert_not @article.valid?
  end

  test "article thumbnail should be valid content_type" do
    @article.image=Rack::Test::UploadedFile.new(Rails.root.join("test/fixtures/files/kitten.txt"))
    assert_not @article.valid?
  end
end
