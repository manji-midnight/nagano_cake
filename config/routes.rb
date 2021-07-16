Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  namespace :admin do
    resources :order_details, only:[:update]
    resources :orders, only:[:index,:show,:update]
    resources :genres, only:[:index,:create,:edit,:update]
    resources :products, only:[:index,:new,:create,:show,:edit,:update]
    resources :customers, only:[:index,:show,:edit,:update]
    root :to => "homes#top"
  end

  namespace :public do
   resources :shippings, only:[:index,:create,:edit,:update]
   resource :users, only:[:show,:edit,:update]
   get 'users/unsubscribe'
   patch 'users/withdraw'
   resources :orders, only:[:new,:create,:index,:show]
   get 'orders/thankyou'
   post 'orders/comfirm'
   resources :cart_products, only:[:new,:create,:index,:show]
   resources :products, only:[:index,:show]
   root :to => "homes#top"
   get 'homes/about'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
