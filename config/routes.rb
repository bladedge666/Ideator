Rails.application.routes.draw do
  get 'ideas/index'
  root 'ideas#index'
end
