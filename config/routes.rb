Rails.application.routes.draw do

  #顧客用
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  #管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  root to: "public/homes#top"
  get "/about", to: "public/homes#about", as: :about
  get "/admin", to: "admin/homes#top", as: :admin

  namespace :public do
    resources :customers, only: [:show, :edit, :update, :unsubscribe, :widhdraw]
    resources :items, only: [:index, :show]
    resources :cartitems, only: [:index, :update, :destroy, :create]
    resources :orders, only: [:new, :confirm, :complete, :create, :index, :show]
    get "my_page", to: "customers#show", as: :customers_my_page
    get "edit", to: "customers#edit", as: :edit
    get "unsubscribe" => "customers#unsubscribe", as: :customers_unsubscribe
    patch "widhdraw" => "customers#widhdraw", as: :customers_widhdraw
    delete "cartitems" => "cartitems#destroy_all", as: :cartitems_destroy_all
  end

  namespace :admin do
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orderdetails, only: [:show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
