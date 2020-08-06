class AddMeetingDateToRatings < ActiveRecord::Migration[6.0]
  def change
    add_column :ratings, :meeting_date, :string
    add_index :ratings, :meeting_date
  end
end
