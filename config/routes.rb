Rails.application.routes.draw do
  devise_for :customers
   devise_for :admins
   
  namespace :admin do
    resources :sessions, only:[:new, :create, :destroy]
    resources :genres, only:[:index, :edit, :create, :update]
    resources :items, except:[:destroy]
    resources :customers, only:[:index, :edit, :show, :update]
    resources :orders, only:[:show, :update]
    resources :order_details, only:[:update]
  end
  
    root to: 'homes#top'
    get "home/about" =>"homes#about"
    resources :registrations, only:[:new, :create]
    resources :sessions, only:[:new, :create, :destroy]
    resources :items, only:[:index, :show]
    resources :cart_items, only:[:index, :update, :destroy, :create]
    delete "cart_items" =>"addresses#destroy_all"
    resources :customers, only:[:edit, :show, :update]
    get "customers/confirm" =>"customer#confirm"
    patch "customers/withdraw" =>"addresses#withdraw"
    resources :orders, only:[:new, :create, :index, :show]
    post "orders/confirm" =>"orders#confirm"
    get "orders/complete" =>"orders#complete"
    get "addresses" =>"addresses#create"
    get "addresses/edit" =>"addresses#edit"
    post "addresses" =>"addresses#create"
    patch "addresses" =>"addresses#update"
    delete "addresses" =>"addresses#destroy"
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
