Rails.application.routes.draw do
  root 'home#welcome'
  get 'sign_up', to: 'users#new', as: :sign_up
  post 'sign_up', to: 'users#create'
end
