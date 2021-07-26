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

  devise_for :customers, controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations'
  }

  scope module: :public do

   resources :products, only:[:index,:show,]
   resources :shippings, only:[:index,:create,:edit,:update,:destroy]
   resource :customers, only:[:show,:update]
   get 'customer_edit' => 'customers#edit', as: 'customer_edit'
   patch 'customers/update' => 'customers#update'
   get 'customers/unsubscribe'
   patch 'customers/withdraw'
   get 'orders/thankyou'
   resources :orders, only:[:new,:create,:index,:show]
   post 'orders/comfirm'
   delete 'cart_products/destroy_all'
   resources :cart_products, only:[:create,:index,:update,:destroy]
   root :to => "homes#top"
   get 'homes/about'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end