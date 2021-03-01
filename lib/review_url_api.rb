# frozen_string_literal: true

require 'open-uri'

class ReviewUrlApi
  class InvalidUrl < StandardError; end

  def self.get_reviews(url)
    begin 
    html_data = Nokogiri::HTML(open(url + '?sort=cmV2aWV3c3VibWl0dGVkX2Rlc2M=&pid=1'))
    rescue Errno::ENOENT
      raise InvalidUrl, "The URL is invalid  - Please review"
    end

    @lender_name = html_data.css('h1')

    # i is set to 290 for time-purposes. there are 291 pages of
    # reviews for this lender
    i = 290
    until html_data.css('.col-xs-12.mainReviews').blank?
      pull_data_from_response(html_data: html_data)
      html_data = Nokogiri::HTML(open(url + '?sort=cmV2aWV3c3VibWl0dGVkX2Rlc2M=&pid=' + i.to_s))
      i += 1
    end
  end

  def self.pull_data_from_response(html_data:)
    html_data.css('.col-xs-12.mainReviews').each do |rev|
      save_review(
        star_rating: rev.css('.numRec'),
        title: rev.css('.reviewTitle'),
        content: rev.css('.reviewText'),
        date_of_review: Date.parse(rev.css('.consumerReviewDate').text),
        author_and_loc: rev.css('.consumerName').text.gsub(/\s+/m, ' ')
          .strip.split(' from ')
      )
    end
  end

  def self.save_review(star_rating:, title:, content:, date_of_review:, author_and_loc:)
    review = Review.new(
      star_rating: star_rating.text[/\(.*?\)/],
      title: title.text,
      content: content.text,
      date_of_review: date_of_review,
      author: author_and_loc[0],
      author_location: author_and_loc[1],
      lender_name: @lender_name.text
    )
    review.save!
  end
end
