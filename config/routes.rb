MapSale::Application.routes.draw do
  root :to => "home#index"
  resources :companies
  resources :shops
  resources :shop_categories
  resources :shop_detail_types
  resources :districts

  namespace :api do
    post "/where", :controller => :search, :action => "now_where"
    get  "/where", :controller => :search, :action => "now_where"
    get  "/practice", :controller => :search, :action => "practice"
  end  
end
