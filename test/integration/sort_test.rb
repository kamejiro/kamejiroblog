require "test_helper"

class SortTest < ActionDispatch::IntegrationTest
  def setup
    @article_latest=articles(:one)
    @article_oldest=articles(:oldest_article)
  end

  test "should include only current category" do
    get root_path
    assert_select 'div#sort', count:1
    assert_select "a[href=?]", article_path(@article_latest), count: 2
    assert_select "a[href=?]", article_path(@article_oldest), count: 0
    get root_path sort:"created_at"
    assert_select 'div#sort', count:1
    assert_select "a[href=?]", article_path(@article_oldest)
    assert_select "a[href=?]", article_path(@article_latest), count: 1
  end
end
