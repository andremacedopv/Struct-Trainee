Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'application#homepage'

  resources :albums, :songs

  scope 'users' do
    get 'new_user', to: 'users#new', as: :new_user
    post 'new_user', to: 'users#create'
  end

end
