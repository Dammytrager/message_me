Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "chat_room#index"

  get "login", to: "session#new"
  post "login", to: "session#create"
  delete "logout", to: "session#destroy"
end
