Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    member do
      get "like", to: "posts#upvote"
      get "dislike", to: "posts#downvote"
    end
    collection do
      get 'search'
      get :autocomplete
    end
    resources :comments
  end

  root 'posts#index'
end
