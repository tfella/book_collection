Rails.application.routes.draw do
  # Place non-resourceful routes above resourceful ones
  get '/countries/data', to: 'countries#data'

  resources :countries do
    collection do
      patch :update_ranks
    end
    member do
      patch :toggle_been
    end
  end

  # Define other routes here
end
