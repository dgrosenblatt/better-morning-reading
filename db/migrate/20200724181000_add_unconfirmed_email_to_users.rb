class AddUnconfirmedEmailToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :unconfirmed_email, :string, index: true
    add_index :users, :unconfirmed_email
  end
end
