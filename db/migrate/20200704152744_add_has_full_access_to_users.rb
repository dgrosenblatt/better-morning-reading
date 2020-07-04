class AddHasFullAccessToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column(:users, :has_full_access, :boolean, default: false)
  end
end
