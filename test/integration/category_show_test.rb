require "test_helper"

class CategoryShowTest < ActionDispatch::IntegrationTest
  def setup
    @category=Category.first
    @article1=articles(:one)
    @article2=articles(:another_category)
  end

  test "should include only current category" do
    get category_url(@category)
    assert_select "a[href=?]", article_path(@article1)
    assert_select "a[href=?]", article_path(@article2), count: 0
  end
end
