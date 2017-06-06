Rails.application.routes.draw do
  resources :players
  #get 'principal/index'

 

root 'principal#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
