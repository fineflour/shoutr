Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new do
    root to: "dashboards#show"
  end

  root to: "homes#show"

  post "text_shouts" => "shouts#create", defaults: { content_type: TextShout}
  post "photo_shouts" => "shouts#create", defaults: { content_type: PhotoShout}

  resources :shouts, only: [:show] do
    member do
      post "like" => "likes#create"
      delete "unlike" => "likes#destroy"
    end
  end


  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resource :search, only: [:show]
  resources :hashtags, only: [:show]
  resources :users, only: [:create, :show] do
    resources :followers, only: [:index]
    member do
      post "follow" => "followed_users#create"
      delete "unfollow" => "followed_users#destroy"
    end
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
