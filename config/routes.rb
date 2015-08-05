Rails.application.routes.draw do

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
  devise_for :users

  post 'add_name' => 'users#add_name'


  root 'welcome#index'

end
