class CreateUserFavoriteBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_favorite_books do |t|
      t.timestamps

      t.references :user, foreign_key: true, null: false, index: true
      t.references :book, foreign_key: true, null: false
    end
  end
end
