Rails.application.routes.draw do

  #管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  scope module: :admin do
    get 'admin_top' => 'homes#top', as: 'admin_top'
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :posts, only: [:index, :show, :edit, :update]
    resources :comments, only: [:index, :show, :edit, :update]
  end


  #会員用
  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :public do
    root 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    get 'top' => 'homes#main', as: 'top'
    get 'my_page' => 'customers#show', as: 'my_page'
    get 'my_info/edit' => 'customers#edit', as: 'edit_my_info'
    patch 'my_info' => 'customers#update', as: 'my_info'
  end
  namespace :public do
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resource :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
      member do
        get :favorites
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
