Rails.application.routes.draw do

  namespace :public do
    root to: "homes#top"
    get "homes/about" => "homes#about", as: "about"
  end

  namespace :admin do
    get "top" => "homes#top"
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit]
  end

  #顧客用
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  #管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
