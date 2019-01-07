Rails.application.routes.draw do

#home page
root "welcome#home"
#routes for tasks
resources :tasks
get "signup", to: "users#new"
resources :users, except: [:new]

get "login", to: "sessions#new"
post "login", to: "sessions#create"
delete "logout", to: "sessions#destroy"

end
