Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :stories do
  	member do
  		put "like", to: "stories#upvote"
  	end
  end

  root "stories#index"
end