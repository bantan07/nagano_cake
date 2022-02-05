Rails.application.routes.draw do
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations'
  }
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
    delete "cart_items/:id" =>"cart_items#destroy"
    delete "cart_items" =>"cart_items#destroy_all",as:"destroy_all"
    get "customers/confirm" =>"customers#confirm"
    patch "customers/withdraw" =>"customers#withdraw",as:"withdraw"
     resource :customer, only:[:show, :edit, :update]
    get "orders/complete" =>"orders#complete"
    resources :orders, only:[:new, :create, :index, :show]
    post "orders/confirm" =>"orders#confirm"
    resources :addresses, only:[:index, :edit, :update]
    post "addresses" =>"addresses#create"
    delete "addresses/:id" =>"addresses#destroy"
  end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
