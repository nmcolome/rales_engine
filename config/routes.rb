Rails.application.routes.draw do
  get "/api/v1/customers/find", to: "api/v1/customers/search#show"
  get "/api/v1/merchants/find", to: "api/v1/merchants/search#show"
  get "/api/v1/items/find", to: "api/v1/items/search#show"

  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
  end
end
