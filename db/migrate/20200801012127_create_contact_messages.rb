class CreateContactMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_messages do |t|
      t.timestamps
      t.string :reply_email, null: false
      t.text :message, null: false
    end
  end
end
