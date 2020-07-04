class CreateStripeCustomerSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :stripe_customer_subscriptions do |t|
      t.timestamps

      t.references :user, foreign_key: true, null: false
      t.string :subscription_id, null: false
      t.string :customer_id, null: false
      t.string :payment_method_id
      t.string :price_id, null: false
      t.string :status, null: false
      t.bigint :current_period_end, null: false
    end
  end
end
