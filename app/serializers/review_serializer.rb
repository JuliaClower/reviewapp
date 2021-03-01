class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :star_rating, :date_of_review, :author,
             :author_location, :lender_name,
             :created_at, :updated_at
end
