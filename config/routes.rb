# Defines the routes for the application
Rails.application.routes.draw do
  root "articles#index" # Defines the root path route ("/")

  #get "/articles", to: "articles#index" # Defines the articles path route ("/articles")
  #get "/articles/:id", to: "articles#show" # Defines the article path route ("/articles/:id") eg. /articles/1

  resources :articles do # Defines the articles path route ("/articles")
    resources :comments # Defines the comments path route ("/articles/:article_id/comments")
  end
end

# Path: app/controllers/articles_controller.rb