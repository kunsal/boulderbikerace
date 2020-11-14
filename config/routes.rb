Rails.application.routes.draw do
  get '/', to: 'home#index'
  resources :submissions
  resources :photos
end
