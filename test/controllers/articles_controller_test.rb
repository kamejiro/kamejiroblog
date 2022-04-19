require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user=users(:one)
    @user2=users(:two)
    @article= articles(:one)
    @article2=articles(:another_category)
  end

  test "should get new" do
    login_test(@user)
    get new_path
    assert_response :success
  end

  test "should get search" do
    get search_path
    assert_response :success
  end

  test "valid get index" do
    login_test(@user)
    get articles_path
    assert_response :success
  end

  test "invalid get index" do
    login_test(@user2)
    get articles_path
    assert_redirected_to root_url
  end

  test "invalid post article without login" do
    get new_path
    assert_not flash.empty?
    assert_redirected_to login_url
    assert_no_difference 'Article.count' do
      post articles_path params: {
        article: {
          title: "testarticletitle",
          category_id: "1",
          abstract: "test_abstract",
          content: "test_content"
        }
      }
    end
  end

  test "invalid post article without admin" do
    login_test(@user2)
    get new_path
    assert_redirected_to root_url
    assert_no_difference 'Article.count' do
      post articles_path params: {
        article: {
          title: "testarticletitle",
          category_id: "1",
          abstract: "test_abstract",
          content: "test_content"
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

  test "invalid delete user without admin" do
    login_test(@user2)
    get articles_path
    assert_redirected_to root_url
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

  test "invalid edit article without login" do
    get edit_article_path(@article)
    assert_not flash.empty?
    assert_redirected_to login_url
    patch article_path(@article), params: {
      article: {
        title:"wrong_title",
        category_id: "0",
        abstract:"wrong_abstract",
        content:"wrong_content"
      }
    }
    assert_redirected_to login_url
    assert_not_equal "wrong_title", @article.title
  end

  test "invalid edit article without admin" do
    login_test(@user2)
    get edit_article_path(@article)
    assert_redirected_to root_url
    patch article_path(@article), params: {
      article: {
        title:"wrong_title",
        category_id: "0",
        abstract:"wrong_abstract",
        content:"wrong_content"
      }
    }
    assert_redirected_to root_url
    assert_not_equal "wrong_title", @article.title
  end

  test "invalid edit article" do
    login_test(@user)
    get edit_article_path(@article)
    assert_template 'articles/edit'
    patch article_path(@article), params: {
      article: {
        title:"",
        category_id: "0",
        abstract:"",
        content:""
      }
    }
    assert_template 'articles/edit'
    assert_select "div.alert", "The form contains 3 errors"
  end
  
  test "valid edit article" do
    new_title="edited article title"
    login_test(@user)
    get edit_article_path(@article)
    assert_response :success
    patch article_path(@article), params: {
      article: {
        title: new_title,
        category_id: "0",
        abstract:"foobar",
        content:"foobar"
      }
    }
    assert_redirected_to root_url
    assert_not flash.empty?
    @article.reload
    assert_equal new_title, @article.title
  end

  test "should get search" do
    get search_path, params: {
      keyword: "テストタイトル"
    }
    assert_select "a[href=?]", article_path(@article), count: 1
    assert_select "a[href=?]", article_path(@article2), count: 0
  end

  test "escape SQL injection" do
    assert_no_difference 'Article.count', do
      get search_path, params: {
        keyword: "'); select * from articles;--('DROP TABLE articles;')"
      }
    end
  end
end
