# frozen_string_literal: true

require 'review_url_api'
class ReviewsController < ApplicationController
  def index
    @reviews = Review.all

    render json: @reviews
  end

  def reviews_by_lender
    @reviews = Review.where(lender_name: params[:lender_name].to_s)

    render json: @reviews
  end

  def get_info
    ReviewUrlApi.get_reviews(url_param)

    render json: Review.all.count
  end

  private

  def url_param
    params.require(:url)
  end
end
