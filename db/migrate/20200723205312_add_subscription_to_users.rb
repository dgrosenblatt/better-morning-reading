class AddSubscriptionToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :stripe_subscription_data, :jsonb
    remove_column :users, :has_full_access, :boolean
  end
end
