Rails.application.routes.draw do
  match 'users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup


  post 'users/edit'
  # users_controler.rb metodo edit

  resources :invitation_lists
  resources :events
  resources :countries
  get 'comments/create'

    resources :posts do
    resources :comments, only: [:create]
  end

  get 'language_users/index'

  get 'language_users/create'
  resources :language_users
  resources :languages
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  post 'add_name' => 'users#add_name'


  root 'welcome#index'

end
