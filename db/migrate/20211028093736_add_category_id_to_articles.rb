class AddCategoryIdToArticles < ActiveRecord::Migration[6.1]
  def change
    add_reference :articles, :category, null: false, foreign_key: true
    add_index :articles, [:category_id, :created_at]
  end
end
