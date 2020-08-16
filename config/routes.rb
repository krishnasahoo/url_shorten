Rails.application.routes.draw do  
  root to: 'home#index'
  resources :short_links, :only=>[:create]
  resources :stats, :only=>[:index]
  get   '/:key', :to =>'home#track_clicks'
end
