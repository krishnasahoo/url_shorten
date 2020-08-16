Rails.application.routes.draw do
  get 'stats/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
  resources :short_links, :only=>[:create]
  resources :stats, :only=>[:index]
  get   "/:key", :to =>'home#track_clicks'
end
