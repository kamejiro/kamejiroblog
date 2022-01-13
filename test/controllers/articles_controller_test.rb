require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user=users(:one)
    @article= articles(:one)
  end

  test "should get new" do
    login_test(@user)
    get new_path
    assert_response :success
  end

  test "should get index" do
    login_test(@user)
    get articles_path
    assert_response :success
  end

  test "invalid post article without login" do
    get new_path
    assert_not flash.empty?
    assert_redirected_to login_url
    assert_no_difference 'Article.count' do
      post articles_path params: {
        article: {
          title: "",
          category_id: "0",
          abstract: "",
          content: ""
        }
      }
    end
  end

  test "invalid post article with login" do
    login_test(@user)
    get new_path
    assert_no_difference 'Article.count' do
      post articles_path params: {
        article: {
          title: "",
          category_id: "0",
          abstract: "",
          content: ""
        }
      }
    end
    assert_template 'articles/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert'
    assert_select 'div.alert-danger'
  end

  test "invalid post article2 with login" do
    login_test(@user)
    get new_path
    assert_no_difference 'Article.count' do
      post articles_path params: {
        article: {
          title: "test",
          category_id: "",
          abstract: "test",
          content: "test"
        }
      }
    end
    assert_redirected_to new_url
    # assert_template 'articles/new'
  end

  test "valid post article" do
    login_test(@user)
    get new_path
    assert_difference 'Article.count', 1 do
      post articles_path params: {
        article: {
          title: "testarticletitle",
          category_id: "1",
          abstract: "test_abstract",
          content: "test_content"
        }
      }
    end
    assert_redirected_to root_url
    assert_not flash.empty?
  end

  test "invalid delete user without login" do
    get articles_path
    assert_not flash.empty?
    assert_redirected_to login_url
    assert_no_difference 'Article.count' do
      delete article_path(@article)
    end
  end

  test "valid delete article" do
    login_test(@user)
    get articles_path
    assert_difference 'Article.count', -1 do
      delete article_path(@article)
    end
    assert_redirected_to articles_url
    assert_not flash.empty?
  end
end
