class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.string :author
      t.integer :star_rating
      t.date :date_of_review

      t.timestamps
    end
  end
end
