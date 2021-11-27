require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category=categorys(:one)
  end

  test "category should be present" do
    @category.category=""
    assert_not @category.valid?
  end

  test "category should be unique" do
    duplicate_category=@category.dup
    @category.save
    assert_not duplicate_category.valid?
  end

  test "category should not be too long" do
    @category.category="a"*21
    assert_not @category.valid?
  end



end
