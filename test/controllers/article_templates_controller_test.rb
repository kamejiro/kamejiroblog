require "test_helper"

class ArticleTemplatesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user=users(:one)
    @user2=users(:two)
    @article_template=article_templates(:one)
  end

  test "should get new" do
    login_test(@user)
    get article_templates_new_url
    assert_response :success
  end

  test "should get index" do
    login_test(@user)
    get article_templates_url
    assert_response :success
  end

  test "should get edit" do
    login_test(@user)
    get edit_article_template_url(@article_template)
    assert_response :success
  end
end
