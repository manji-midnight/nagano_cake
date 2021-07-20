Rails.application.routes.draw do
  
  devise_for :admins, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }
  
  namespace :admin do
    resources :order_details, only:[:update]
    resources :orders, only:[:index,:show,:update]
    resources :genres, only:[:index,:create,:edit,:update]
    resources :products, only:[:index,:new,:create,:show,:edit,:update]
    resources :customers, only:[:index,:show,:edit,:update]
    root :to => "homes#top"
   
  end

  scope module: :public do
    devise_for :users, controllers: {
    sessions:      'public/users/sessions',
    passwords:     'public/users/passwords',
    registrations: 'public/users/registrations'
  }
   resources :products, only:[:index,:show,]
   resources :shippings, only:[:index,:create,:edit,:update]
   resource :users, only:[:show,:edit,:update]
   get 'users/unsubscribe'
   patch 'users/withdraw'
   resources :orders, only:[:new,:create,:index,:show]
   get 'orders/thankyou'
   post 'orders/comfirm'
   resources :cart_products, only:[:create,:index,:update,:show,:destroy]
   delete 'cart_products/destroy_all'
   root :to => "homes#top"
   get 'homes/about'
   
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end