class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.timestamps
      t.string :name, null: false
      t.string :author, null: false
      t.string :coverImageThumbS3Key, null: false
      t.string :coverImageFullS3Key, null: false
    end
  end
end
