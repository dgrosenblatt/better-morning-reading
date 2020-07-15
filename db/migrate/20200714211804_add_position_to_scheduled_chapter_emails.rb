class AddPositionToScheduledChapterEmails < ActiveRecord::Migration[6.0]
  def change
    add_column :scheduled_chapter_emails, :position, :integer, null: false
  end
end
