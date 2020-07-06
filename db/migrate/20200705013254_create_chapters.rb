class CreateChapters < ActiveRecord::Migration[6.0]
  def change
    create_table :chapters do |t|
      t.timestamps

      t.references :book, foreign_key: true, null: false
      t.integer :position, null: false
      t.string :name, null: false
      t.text :text_s3_key, null: false
    end
  end
end
