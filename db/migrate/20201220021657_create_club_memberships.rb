class CreateClubMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :club_memberships do |t|
      t.timestamps

      t.references :club, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
    end

    add_index(:club_memberships, [:club_id, :user_id], unique: true)
  end
end
