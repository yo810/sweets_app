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
  get "/customers/my_page", to: "public/customers#show", as: :my_page
  get "/customers/edit/:id", to: "public/customers#edit", as: :edit

  namespace :public do
    resources :customers, only: [:show, :edit, :update, :unsubscribe, :widhdraw]
  end

  namespace :admin do
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orderdetails, only: [:show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
