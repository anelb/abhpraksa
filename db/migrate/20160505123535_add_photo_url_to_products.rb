class AddPhotoUrlToProducts < ActiveRecord::Migration
  def change
    add_column :products, :photo_url, :text
  end
end
