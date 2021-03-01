Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/reviews', to: 'reviews#index'
  get '/reviews/get_info', to: 'reviews#get_info'
  get 'reviews/reviews_by_lender', to: 'reviews#reviews_by_lender'

  match '*unmatched', to: 'application#route_not_found', via: :all
end
