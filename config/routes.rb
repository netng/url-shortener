Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post 'shorten', to: 'shortens#create'
  get '/:shortcode', to: 'shortens#show'
  get '/:shortcode/stats', to: 'stats#show'
end
