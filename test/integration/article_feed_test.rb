require "test_helper"

class ArticleFeedTest < ActionDispatch::IntegrationTest
  def setup
    @articleone=articles(:one)
  end

  #article feed
  test "body should include article link" do
    get root_path
    #pagination
    assert_select 'div.pagination', count:1
    assert_select "a[href=?]", '/?page=2&sort=created_at+desc'
    #article link
    Article.paginate(page: 1, per_page: 10).each do |article|
      assert_select 'a[href=?]', article_path(article)
    end
    assert_match @articleone.title.to_s, response.body
    image=fixture_file_upload('test/fixtures/files/kitten.jpg', 'image/jpeg')
    @articleone.image.attach(image)
    get root_path
    assert_select 'li img'
  end

  # sidebar test

end
