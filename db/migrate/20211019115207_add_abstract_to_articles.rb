class AddAbstractToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :abstract, :string
  end
end
