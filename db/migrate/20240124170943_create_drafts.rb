class CreateDrafts < ActiveRecord::Migration[6.1]
  def change
    create_table :drafts do |t|
      t.references :category, null: false, foreign_key: true
      t.text :title
      t.text :abstract
      t.text :content

      t.timestamps
    end
  end
end
