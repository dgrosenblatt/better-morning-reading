class CreateClubs < ActiveRecord::Migration[6.0]
  def change
    create_table :clubs do |t|
      t.timestamps

      t.references :book, foreign_key: true, null: false
      t.references :organizer, foreign_key: { to_table: :users }, null: false
      t.string :status, null: false
      t.string :passcode, null: false, unique: true, index: true
      t.boolean :sunday, null: false, default: false
      t.boolean :monday, null: false, default: false
      t.boolean :tuesday, null: false, default: false
      t.boolean :wednesday, null: false, default: false
      t.boolean :thursday, null: false, default: false
      t.boolean :friday, null: false, default: false
      t.boolean :saturday, null: false, default: false
    end
  end
end
