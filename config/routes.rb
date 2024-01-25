Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root to: 'municipes#index'
  resources :municipes, except: [:destroy]
end
