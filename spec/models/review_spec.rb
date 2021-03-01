require 'rails_helper'

RSpec.describe Review, type: :model do
  it 'provides a message when an invalid URL is passed in' do
    expect { ReviewUrlApi.get_reviews('www.lendingtree.com/reviews/personal/first-midwest-bank/52903183') }
      .to raise_error('The URL is invalid  - Please review')
  end

  it 'raises a validation error if no lender name is available' do
    expect { Review.create }.to raise_error('Lender name is required.')
  end
end
