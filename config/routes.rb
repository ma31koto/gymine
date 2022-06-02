Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions",
  }

  namespace :admin do
    resources :posts do
    end
    resources :areas, only: [:index, :create, :edit, :update, :destroy]
    resources :machines, only: [:index, :create, :edit, :update, :destroy]
    resources :body_parts, only: [:index, :create, :edit, :update, :destroy]
  end

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
  }

  scope module: :public do
    root :to => "homes#top"
    resources :posts, only: [:show] do
      collection do
        get 'map_search' => 'posts#map_search'
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
