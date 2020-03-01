Rails.application.routes.draw do
  scope module: :publics do
    resource :end_users, only: [:show, :edit, :update, :destroy]
    resources :items, only: [:index]
    # get 'end_users/withdraw_confirmation' => 'end_users#withdraw_confirmation'
  end
  devise_for :end_users, controllers: {
    sessions: 'publics/sessions',
    passwords: 'publics/passwords',
    registrations: 'publics/registrations'
  }
  devise_scope :end_user do
    root to: 'publics/sessions#new'
  end
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  namespace :admins do
    resources :items, except: [:destroy]
    resources :end_users, only: [:index, :show, :edit, :update]
  end
end
