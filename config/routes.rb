Rails.application.routes.draw do
  devise_for :end_users, controllers: {
    sessions: 'publics/sessions',
    passwords: 'publics/passwords',
    registrations: 'publics/registrations'
  }, skip: :all
  devise_scope :end_user do
    get '/end_users/sign_in' => 'publics/sessions#new', as: 'new_end_user_session'
    post '/end_users/sign_in' => 'publics/sessions#create', as: 'end_user_session'
    delete '/end_users/sign_out' => 'publics/sessions#destroy', as: 'destroy_end_user_session'
    get '/end_users/sign_up' => 'publics/registrations#new', as: 'new_end_user_registration'
    post '/end_users' => 'publics/registrations#create', as: 'end_user_registration'
    root to: 'publics/sessions#new'
  end
  scope module: :publics do
    resource :end_users, only: [:show, :edit, :update, :destroy]
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :orders, only: [:index, :new, :create]
    get "/orders/purchase_confirmation" => "orders#purchase_confirmation"
    get "/orders/purchase_completed" => "orders#purchase_completed"
    # get 'end_users/withdraw_confirmation' => 'end_users#withdraw_confirmation'
  end
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }, skip: :all
  devise_scope :admin do
    get '/admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post '/admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete '/admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
  end
  namespace :admins do
    resources :items, except: [:destroy]
    resources :end_users, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :update, :destroy]
    resources :orders, only: [:index, :show, :update]
    resources :order_items, only: [:update]
  end
end
