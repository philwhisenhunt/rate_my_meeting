class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :content
      t.integer :user_id
      t.date :meeting

      t.timestamps
    end
  end
end
