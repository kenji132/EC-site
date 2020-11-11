Rails.application.routes.draw do
  # #エンドユーザー
  #  root to: 'end_users#top'
  #  get 'end_users/my_page', to: 'end_users#show'
  #  get 'end_users/edit', to: 'end_users#edit'
  #  patch 'end_users/edit', to: 'end_users#update'
  #  get 'end_users/unsubscribe', to: 'end_users#unsubscribe'
  #  patch 'end_users/withdraw', to: 'end_users#withdraw'
  #  #商品end_user
  #  get '/items', to: 'items#index'
  #  get '/items/:id', to: 'items#show', as: 'item'
  #  #カート内商品end_user
  #  get '/cart_items', to: 'cart_items#index'
  #  patch '/cart_items/:id', to: 'cart_items#update'
  #  delete '/cart_items/:id', to: 'cart_items#destroy'
  #  delete '/cart_items/:destroy_all', to: 'cart_items#destroy_all'
  #  post '/cart_items', to: 'cart_items#create'


   
  #  #管理者
  #  get 'admin/', to: 'admins#top'
  #  get 'admin/end_users', to: 'admins#index'
  #  #商品admin
  #  get 'admin/items', to: 'admin_items#index'
  #  get 'admin/items/new', to: 'admin_items#new'
  #  post 'admin/items/new', to: 'admin_items#create'
  #  get 'admin/items/:id', to: 'admin_items#show', as: 'admin_item'
  #  #ジャンル
  #  get 'admin/genres', to: 'genres#index'
  #  post 'admin/genres', to:'genres#create'
  #  get 'admin/genres/:id/edit', to: 'genres#edit', as:'admin_edit_genres'
  #  patch 'admin/genres/:id/edit', to: 'genres#update', as:'admin_update_genres'
  #  put 'admin/genres/:id/edit', to: 'genres#update'



  # namespace :public do 
  #   resources :items, only: [:index,:new,:create,:show,:edit,:update], path:'/'
  #   resources :cart_items, only: [:index,:update,:destroy,:destroy_all,:create], path:'/'
  #   resources :end_users, only: [:show,:edit,:update,:unsubscribe,:withdraw], path: 'end_users'
  # end

  scope module: 'public' do
    root to: 'items#top'
    resources :items, only: [:index,:new,:create,:show,:edit,:update]
    resources :cart_items, only: [:index,:update,:destroy,:destroy_all,:create]
    get 'cart_items/destroy_all', to: 'cart_items#destroy_all',as: 'cart_items_destroy_all'
    get 'end_users/my_page', to: 'end_users#show'
    get 'end_users/edit', to: 'end_users#edit'
    patch 'end_users/edit', to: 'end_users#update'
    get 'end_users/unsubscribe', to: 'end_users#unsubscribe'
    patch 'end_users/withdraw', to: 'end_users#withdraw'
    
    post 'orders/confirm', to: 'orders#confirm',as: 'confirm'
    get 'orders/complete', to: 'orders#complete'
    resources :orders, only: [:index,:show,:create,:new]

    resources :addresses, only: [:index,:create,:edit,:update,:destroy]
  end
  namespace :admin do 
    root to: 'top#top'
    resources :items, only: [:index,:new,:create,:show,:edit,:update] do
      collection do 
        get 'search'
      end
    end
    resources :genres, only: [:index,:create,:edit,:update]
    patch 'genres/:id/edit', to: 'genres#update'
    resources :end_users, only: [:index]
    resources :orders, only: [:index,:show,:update]
    resources :order_details, only: [:update]
  end




  devise_for :admin, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :end_users, controllers: {
    sessions:      'end_users/sessions',
    passwords:     'end_users/passwords',
    registrations: 'end_users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
