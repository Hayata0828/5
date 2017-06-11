Rails.application.routes.draw do
  devise_for :managers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'product#index'
  get 'product/new' => 'product#new'
  post 'product/create' => 'product#create'
  get 'product/:id' => 'product#show'
  get 'product/:id/edit' => 'product#edit'
  patch 'product/:id/update' => 'product#update'
  delete 'product/:id/destroy' => 'product#destroy'

  post 'product/create' => 'product_image#create'

  get 'mypage' => 'manager#index'
end
