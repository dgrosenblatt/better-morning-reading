class CreateScheduledClubEmails < ActiveRecord::Migration[6.0]
  def change
    create_table :scheduled_club_emails do |t|
      t.timestamps

      t.references :club, foreign_key: true, null: false
      t.references :chapter, foreign_key: true, null: false

      t.timestamp :sent_at
      t.integer :position, null: false
    end
  end
end
