class ChangeStarRatingToString < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :star_rating, :string
    add_column :reviews, :author_location, :string
  end
end
