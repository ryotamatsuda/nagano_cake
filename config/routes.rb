Rails.application.routes.draw do
  devise_for :end_users, controllers: {
    sessions: 'publics/sessions',
    passwords: 'publics/passwords',
    registrations: 'publics/registrations'
  }
  devise_scope :end_user do
    root to: 'publics/sessions#new'
  end
  scope module: :publics do
    resources :end_users, only: [:show]
  end
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  namespace :admins do
    resources :items
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
