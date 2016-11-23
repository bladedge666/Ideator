Rails.application.routes.draw do
  get 'about' => 'static#about'

  get 'random' => 'static#random'

  root 'ideas#index'
  resources :ideas
end
