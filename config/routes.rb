Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :customers do
        get "/find", to: "search#show"
        get "/find_all", to: "search#index"
        get "/random", to: "random#show"
      end

      namespace :merchants do
        get "/find", to: "search#show"
        get "/find_all", to: "search#index"
        get "/random", to: "random#show"
      end

      namespace :items do
        get "/find", to: "search#show"
        get "/find_all", to: "search#index"
        get "/random", to: "random#show"
      end

      namespace :invoices do
        get "/find", to: "search#show"
        get "/find_all", to: "search#index"
        get "/random", to: "random#show"
      end

      namespace :transactions do
        get "/find", to: "search#show"
        get "/find_all", to: "search#index"
        get "/random", to: "random#show"
      end

      namespace :invoice_items do
        get "/find", to: "search#show"
        get "/find_all", to: "search#index"
        get "/random", to: "random#show"
      end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        get "/items", to: "merchants/items#index"
        get "/invoices", to: "merchants/invoices#index"
      end

      resources :customers, only: [:index, :show]
      resources :items, only: [:index, :show]

      resources :invoices, only: [:index, :show] do
        get "/transactions", to: "invoices/transactions#index"
        get "/invoice_items", to: "invoices/invoice_items#index"
        get "/items", to: "invoices/items#index"
        get "/customer", to: "invoices/customer#show"
        get "/merchant", to: "invoices/merchant#show"
      end

      resources :transactions, only: [:index, :show]

      resources :invoice_items, only: [:index, :show] do
        get "/invoice", to: "invoice_items/invoice#show"
        get "/item", to: "invoice_items/item#show"
      end
    end
  end
end
