class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.timestamps
      t.string :name, null: false
      t.string :email, null: false
      t.index :email
    end
  end
end
