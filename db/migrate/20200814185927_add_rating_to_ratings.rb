class AddRatingToRatings < ActiveRecord::Migration[6.0]
  def change
    add_column :ratings, :rating, :integer
  end
end
