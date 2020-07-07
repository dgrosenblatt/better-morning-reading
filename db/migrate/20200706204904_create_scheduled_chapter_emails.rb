class CreateScheduledChapterEmails < ActiveRecord::Migration[6.0]
  def change
    create_table :scheduled_chapter_emails do |t|
      t.timestamps

      t.references :subscription, foreign_key: true, null: false
      t.references :chapter, foreign_key: true, null: false

      t.timestamp :sent_at
    end
  end
end
