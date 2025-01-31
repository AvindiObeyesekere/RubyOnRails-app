Rails.application.routes.draw do
  get "home/welcome"
  root "articles#index"
  get "/articles" , to: "articles#index"

  
end
