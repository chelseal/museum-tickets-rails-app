Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "museums#index"
  get "/museums", to: "museums#index", as: "museums"
  post "/museums", to: "museums#create"
  get "/museums/new", to: "museums#new", as: "new_museum"
  get "/museums/:id/edit", to: "museums#edit", as: "edit_museum"
  get "/museums/:id", to: "museums#show", as: "museum"
  patch "/museums/:id", to: "museums#update"
  put "/museums/:id", to: "museums#update"
  get "/listings", to: "listings#index", as: "listings"
  post "/listings", to: "listings#create"
  get "/listings/new", to: "listings#new", as: "new_listing"
  get "/listings/:id/edit", to: "listings#edit", as: "edit_listing"
  get "/listings/:id", to: "listings#show", as: "listing"
  patch "/listings/:id", to: "listings#update"
  put "/listings/:id", to: "listings#update"
  get "/styles", to: "styles#index", as: "styles"
  # get "/styles/:id", to: "styles#show", as: "style"
  get "payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"
  get "/payments/:id", to: "payments#show", as: "payment"
end
