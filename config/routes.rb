Rails.application.routes.draw do
  namespace :public do
    resources :recipes, only: [:index, :show, :edit, :create, :update, :destroy] do
      resources :recipe_comments, only: [:create, :destroy]
      resources :favorites, only: [:create, :destroy]
    end
    resources :customers, only: [:index, :show, :edit, :update]
  end
  # 管理用レシピ
  namespace :admin do
    resources :recipes
  end
  
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: 'homes#top'
  get "/homes/about" => "homes#about", as: 'about'
  
  # 退会確認画面
  get '/customers/:id/unsubscribe' => 'public/customers#unsubscribe', as: 'customer_unsubscribe'
  # 論理削除用のルーティング
  patch '/customers/:id/withdrawal' => 'public/customers#withdrawal', as: 'customers_withdrawal'

  
end
