class RenamePostImageIdColumnToFavorites < ActiveRecord::Migration[6.1]
  def change
    rename_column :favorites, :post_image_id, :book_id
  end
end
