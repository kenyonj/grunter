Grunter::Application.routes.draw do

  root "homes#show"

  resources :grunts, except: [:new, :create, :index]

  resources :users, only: [:show, :index] do
    resources :grunts, only: [:new, :create]
    member do
      post "follow" => "following_relationships#create"
      post "unfollow" => "following_relationships#destroy"
    end
  end

end
