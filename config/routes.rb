Rails.application.routes.draw do
  get 'profiles/show/:nickname', to: 'profiles#show', as: 'user/profile'
  get 'profiles/show'
  get 'profiles/edit'
  post 'profiles/edit'
  get 'users/show_users'

  get 'show' => 'profiles#show'

  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks',
    registrations: 'users/registrations'
  }


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

  post 'add_name' => 'users#add_name'


  root 'welcome#index'

end
