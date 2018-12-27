Rails.application.routes.draw do

#home page
root "welcome#home"
#routes for tasks
resources :tasks
end
