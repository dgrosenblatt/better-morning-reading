class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.timestamps
      t.string :name, null: false
      t.string :author, null: false
      t.string :cover_image_thumb_s3_key, null: false
      t.string :cover_image_full_s3_key, null: false
    end
  end
end
