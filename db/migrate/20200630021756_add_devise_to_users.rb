# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[6.0]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ''

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      # Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
    end
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
  end

  def self.down
    remove_index :users, name: :index_users_on_reset_password_token
    remove_index :users, name: :index_users_on_confirmation_token

    remove_column :users, :encrypted_password
    remove_column :users, :reset_password_token
    remove_column :users, :reset_password_sent_at
    remove_column :users, :confirmation_token
    remove_column :users, :confirmed_at
    remove_column :users, :confirmation_sent_at
  end
end
