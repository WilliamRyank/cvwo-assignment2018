Rails.application.routes.draw do

#home page
root "welcome#home"
#routes for tasks
resources :tasks
get "signup", to: "users#new"
resources :users, except: [:new]

get "signin", to: "sessions#new"
post "signin", to: "sessions#create"
delete "signin", to: "sessions#destroy"

end
