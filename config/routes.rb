Rails.application.routes.draw do
 
  resources :countries do
    collection do
      patch :update_ranks
    end
    member do
      patch :toggle_been
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
