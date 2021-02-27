class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :star_rating, :date_of_review, :author,
             :created_at, :updated_at
end
