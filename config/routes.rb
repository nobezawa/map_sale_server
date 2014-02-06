MapSale::Application.routes.draw do
  root :to => "home#index"
  resources :companies
  resources :shops do
    collection do
      get :event_new
      post :event_create
    end
    member do
      get :event_new
    end
  end
  resources :shop_categories
  resources :shop_detail_types
  resources :districts
  resources :events
  
  namespace :api do
    post "/where", :controller => :search, :action => "now_where"
    get  "/where", :controller => :search, :action => "now_where"
    get  "/practice", :controller => :search, :action => "practice"
  end  
end
