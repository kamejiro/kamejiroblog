class Deletedrafts < ActiveRecord::Migration[6.1]
  def change
    drop_table :drafts
  end
end
