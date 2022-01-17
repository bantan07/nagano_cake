Rails.application.routes.draw do
  devise_for :customers
  
  devise_for :admins, controllers: {
  sessions: 'admin/sessions'
  }
  namespace :admin do
    root to: 'homes#top'
    resources :genres, only:[:index, :edit, :create, :update]
    resources :items, except:[:destroy]
    resources :customers, only:[:index, :edit, :show, :update]
    resources :orders, only:[:show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
