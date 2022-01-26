Rails.application.routes.draw do
  devise_for :customers
  # devise_for :admin
  # devise_scope :customer do
  #   get "customers/sign_in" =>"devise/sessions#new"
  #   post "customers/sign_in" =>"devise/sessions#create"
  #   delete "customers/sign_out" =>"devise/sessions#destroy"
  #   get "customers/sign_up" =>"devise/registrations#new"
  #   post "customers/sign_up" =>"devise/registrations#create"
  # end  
  # devise_for :admins, skip: :all
  # devise_scope :admin do
  #   get "admin/sign_in" =>"admin/sessions#new"
  #   post "admin/sign_in" =>"admin/sessions#create"
  #   delete "admin/sign_out" =>"admin/sessions#destroy"
  # end
  devise_for :admins, path: 'admin', skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    root to: 'homes#top'
    resources :genres, only:[:index, :edit, :create, :update]
    resources :items, except:[:destroy]
    resources :customers, only:[:index, :edit, :show, :update]
    resources :orders, only:[:show, :update]
    resources :order_details, only:[:update]
  end
  
  scope module: :public do
    root to: 'homes#top'
    get "home/about" =>"homes#about"
    resources :items, only:[:index, :show]
    resources :cart_items, only:[:index, :update, :delete, :create]
    delete "cart_items" =>"cart_items#destroy_all"
    get "customers/edit" =>"customers#edit"
    get "customers" =>"customers#show"
    get "customers/confirm" =>"customer#confirm"
    patch "customers" =>"customers#update"
    patch "customers/withdraw" =>"addresses#withdraw"
    resources :orders, only:[:new, :create, :index, :show]
    post "orders/confirm" =>"orders#confirm"
    get "orders/complete" =>"orders#complete"
    resources :addresses, only:[:index, :edit, :update, :delete]
    post "addresses" =>"addresses#create"
    
    
  end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
