Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"

  # "GET /articles requests are mapped to the index action of ArticlesController"
  # https://guides.rubyonrails.org/getting_started.html#say-hello-rails
  # Nice and short and clear!
  get "/articles", to: "articles#index"
  get "/foo", to: "articles#foo"

  get "/read/:id", to: "articles#read"

  resources :posts do
    # Nested resource
    # https://guides.rubyonrails.org/getting_started.html#adding-a-route-for-comments
    resources :comments
  end
end
