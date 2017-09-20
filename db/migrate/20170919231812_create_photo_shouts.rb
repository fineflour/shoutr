class CreatePhotoShouts < ActiveRecord::Migration[5.1]
  def change
    create_table :photo_shouts do |t|
      t.attachment :image, null: false

      t.timestamps
    end
  end
end
