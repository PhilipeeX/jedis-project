Rails.application.routes.draw do
  resources :municipes, except: [:destroy]
end
