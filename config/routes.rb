Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "pages#home", as: "root"
  # get "/milkshakes", to: "milkshakes#index", as: "milkshakes"
  # get "/milkshakes/new", to: "milkshakes#new", as: "new_milkshake"
  # get "/milkshakes/:id", to: "milkshakes#show", as: "milkshake"
  # post "/milkshakes", to: "milkshakes#create"
  # patch "/milkshakes/:id", to: "milkshakes#update"
  # get "/milkshakes/:id/edit", to: "milkshakes#edit", as: "edit_milkshakes"

  resources :museums
  resources :listings
  resources :styles
  resources :payments


  # get “/museums”, to: “museums#index, as: “museums”
  # post “/museums”, to: “museums#create”
  # get “/museum/new”, to: “museums/new”, as: “new_museums”
  # get “/museums/:id/edit”, to: “museums#edit”, as: “edit_museum”
  # get “/museums/:id”, to: “museums#show”, as: “museum”
  # patch “/museums/:id”, to: “museums#update”
  # put “/museums/:id”, to: “museums#update”
  # delete “/museums/:id”, to: “museums#destroy”
  # get “/listings”, to: “listings#index”, as: “listings”
  # post “/listings”, to: “listings#create
  # get “/listings/new”, to: “listings#new”, as: “new_listing”
  # get “/listings/:id/edit”, to: “listings#edit”, as: “edit_listing”
  # get “/listings/:id”, to: “listings#show”, as: “listing”
  # patch “/listings/:id”, to: “listings#update”
  # put “/listings/:id”, to: “listings#update”
  # delete “/listings/:id”, to: “listings#destroy”
  # get “/styles”, to: “styles#index”, as: “styles”
  # post “/styles”, to: “styles#create”
  # get “/styles/new”, to: “styles#new”, as: “new_style”
  # get “/styles/:id/edit”, to: “styles#edit”, as: “edit_style”
  # get “/styles/:id”, to: “styles#show”, as: “style”
  # patch “/styles/:id”, to: “styles#update”
  # put “/styles/:id”, to: “styles#update”
  # delete “/styles/:id, to: “styles#destroy”
  # get “/payments”, to: “payments#index”, as: “payments”
  # post “/payments”, to: “payments#create”
  # get “/payments/new”, to: “payments#new”, as: “new_payment”
  # get “/payments/:id/edit”, to: “payments#edit”, as: “edit_payment”
  # get “/payments/:id”, to: “payments#show”, as: “payment”
  # patch  “/payments/:id”, to: “payments#update”
  # put “/payments/:id”, to: “payments#update”
  # delete "/payments/:id", to: "payments#destroy"
  
end
