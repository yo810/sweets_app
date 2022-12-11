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

  # トップ画面
  root to: "public/homes#top"

  # scope module:を使用、URLに"public"が表示されないように変更
  scope module: :public do
    # 顧客トップ画面
    get 'homes/about'

    # 商品ページ
    resources :items, only: [:index, :show]

    # 顧客ページ
    get 'customers/my_page' => 'customers#show', as: :my_page
    get 'customers/:id/edit' => "customers#edit", as: :edit
    get 'customers/unsubscribe' => "customers#unsubscribe", as: :unsubscribe
    patch "customers/widhdraw" => "customers#widhdraw", as: :widhdraw
    resources :customers, only: [:update]

    # カート内ページ
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete "customers/cart_items" => "cart_items#destroy_all", as: :destroy_all

    # 注文ページ
    resources :orders, only:[:new, :index, :show]
    get 'orders/complete' => 'orders#complete', as: :complete
    post 'orders/confirm' => 'orders#confirm', as: :confirm
    post 'orders' => 'orders#create', as: :create_order

    # 配送先ページ
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
  end

  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:update]
    resources :orderdetails, only: [:show, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
