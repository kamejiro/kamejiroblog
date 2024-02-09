class CreateArticleTemplates < ActiveRecord::Migration[6.1]
  def change
    create_table :article_templates do |t|
      t.text :title
      t.text :abstract
      t.text :content

      t.timestamps
    end
  end
end
