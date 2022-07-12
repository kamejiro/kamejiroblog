class RenameIamgeUrlColumnToImages < ActiveRecord::Migration[6.1]
  def change
    rename_column :images, :iamge_url, :file_url
  end
end
