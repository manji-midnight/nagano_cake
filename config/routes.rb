Rails.application.routes.draw do
  namespace :admin do
    get 'order_detailes/update'
  end

  namespace :admin do
    get 'orders/index'
  end

  namespace :admin do
    get 'orders/show'
  end

  namespace :admin do
    get 'orders/update'
  end

  namespace :admin do
    get 'genres/index'
  end

  namespace :admin do
    get 'genres/create'
  end

  namespace :admin do
    get 'genres/edit'
  end

  namespace :admin do
    get 'genres/update'
  end

  namespace :admin do
    get 'products/index'
  end

  namespace :admin do
    get 'products/new'
  end

  namespace :admin do
    get 'products/create'
  end

  namespace :admin do
    get 'products/show'
  end

  namespace :admin do
    get 'products/edit'
  end

  namespace :admin do
    get 'products/update'
  end

  namespace :admin do
    get 'customers/index'
  end

  namespace :admin do
    get 'customers/show'
  end

  namespace :admin do
    get 'customers/edit'
  end

  namespace :admin do
    get 'customers/update'
  end

  namespace :public do
    get 'shippings/index'
  end

  namespace :public do
    get 'shippings/create'
  end

  namespace :public do
    get 'shippings/edit'
  end

  namespace :public do
    get 'shippings/update'
  end

  namespace :public do
    get 'users/show'
  end

  namespace :public do
    get 'users/edit'
  end

  namespace :public do
    get 'users/update'
  end

  namespace :public do
    get 'users/unsubscribe'
  end

  namespace :public do
    get 'users/withdraw'
  end

  namespace :public do
    get 'orders/new'
  end

  namespace :public do
    get 'orders/create'
  end

  namespace :public do
    get 'orders/index'
  end

  namespace :public do
    get 'orders/show'
  end

  namespace :public do
    get 'orders/thankyou'
  end

  namespace :public do
    get 'orders/comfirm'
  end

  namespace :public do
    get 'cart_products/new'
  end

  namespace :public do
    get 'cart_products/create'
  end

  namespace :public do
    get 'products/index'
  end

  namespace :public do
    get 'products/show'
  end

  namespace :public do
    get 'homes/top'
  end

  namespace :public do
    get 'homes/about'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
