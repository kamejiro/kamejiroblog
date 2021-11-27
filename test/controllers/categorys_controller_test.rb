require "test_helper"

class CategorysControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category=categorys(:one)
    @article=@category.articles.build(title: "Example article", content: "content", category_id: 1)
  end

  test "should get show" do
    get category_url(@category)
    assert_response :success
  end
end
