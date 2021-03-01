require 'rails_helper'

RSpec.describe ReviewsController, type: :request do
  let(:json) { JSON.parse(response.body) }
  let!(:review_1) { Review.create(lender_name: 'Banana Mortgage') }
  let!(:review_2) { Review.create(lender_name: 'Watermelon Loans') }

  it 'gets all reviews' do
    get '/reviews'

    expect(response.status).to eq 200
    expect(json.count).to eq 2
  end

  it 'shows reviews of provided lender name' do
    get '/reviews/reviews_by_lender',
        params: { lender_name: 'Banana Mortgage' }

    expect(response.status).to eq 200
    expect(json.count).to eq 1
  end

  it 'rereives and saves reviews from provided url' do
    get '/reviews/get_info',
        params: { url: 'https://www.lendingtree.com/reviews/personal/first-midwest-bank/52903183' }

    expect(response.status).to eq 200
    expect(response.body).to eq '24'
  end

  it 'returns a 404 not found if an invalid route is given' do
    get '/reviews/apples'

    expect(response.status).to eq 404
  end

  it 'returns a 400 if a parameter is missing in a request' do
    get '/reviews/get_info'

    expect(response.status).to eq 400
  end
end
