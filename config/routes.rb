Rails.application.routes.draw do

  #ゲストユーザー用
  devise_scope :user do
    post 'users/guest_sign_in' => 'users/sessions#guest_sign_in'
  end

  #管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  scope module: :admin do
    get 'admin_top' => 'homes#top', as: 'admin_top'
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :posts, only: [:index, :show, :edit, :update] do
     resource :comments, only: [:show, :edit, :update]
    end
  end

  #会員用
  devise_for :customers, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  scope module: :public do
    root 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    get 'top' => 'homes#main', as: 'top'
    get 'my_page' => 'customers#show', as: 'my_page'
    get 'my_info/edit' => 'customers#edit', as: 'edit_my_info'
    patch 'my_info' => 'customers#update', as: 'my_info'
    get 'customers/:id/favorites' => 'customers#favorites', as: 'my_favorites'
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resource :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
  end

  #検索用
  get 'search' => 'searches#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
