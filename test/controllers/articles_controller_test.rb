require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get new_path
    assert_response :success
  end

  test "invalid post article" do
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

  test "invalid post article2" do
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
end
