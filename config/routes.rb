Rails.application.routes.draw do
<<<<<<< HEAD

  devise_for :admins, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

=======
>>>>>>> 8affcfd854fc6bc220b8b745150afb732a40f124
  namespace :admin do
    resources :order_details, only:[:update]
    resources :orders, only:[:index,:show,:update]
    resources :genres, only:[:index,:create,:edit,:update]
    resources :products, only:[:index,:new,:create,:show,:edit,:update]
    resources :customers, only:[:index,:show,:edit,:update]
<<<<<<< HEAD
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
=======
  end

  namespace :public do
   resources :shippings, only:[:index,:create,:edit,:update]
   resource :users, only:[:show,:edit,:update]
   get 'users/unsubscribe'
   patch 'users/withdraw'
   resources :orders, only:[:new,:create,:index,:show]
>>>>>>> 8affcfd854fc6bc220b8b745150afb732a40f124
   get 'orders/thankyou'
   resources :orders, only:[:new,:create,:index,:show]
   post 'orders/comfirm'
<<<<<<< HEAD
   delete 'cart_products/destroy_all'
   resources :cart_products, only:[:create,:index,:update,:destroy]
=======
   resources :cart_products, only:[:new,:create,:index,:show]
>>>>>>> 8affcfd854fc6bc220b8b745150afb732a40f124
   root :to => "homes#top"
   get 'homes/about'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
