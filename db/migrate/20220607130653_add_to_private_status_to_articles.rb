class AddToPrivateStatusToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :private_status, :integer, null: false, default: 0
  end
end
