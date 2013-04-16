Mysample::Application.routes.draw do

# get "sessions/new"

 # get "users/new"

get "log_out" => "sessions#destroy", :as => "log_out"
get "log_in" => "sessions#new", :as => "log_in"
get "sign_up" => "users#new", :as => "sign_up"
get "blog" => "users#blog", :as => "blog"
get "blog_create" => "users#blogcreate", :as => "blog_create"
post "blog_create" => "users#blogcreate", :as => "blog_create"

get "blog_view" => "users#blogview", :as => "blog_view"
get "home" => "users#blogview", :as => "home"
get "friendsblog_view" => "users#friendsblogview", :as => "friendsblog_view"

get "chatwindow" => "users#chatwindow", :as => "chatwindow"

get "user_add" => "users#addusers", :as => "user_add"

get "friend" => "users#addfriends", :as => "friend"
post "friend" => "users#addfriends", :as => "friend"

get "showfriend" => "users#showfriends", :as => "showfriend"
get "myfriend" => "users#myfriends", :as => "myfriend"

get "chat" => "users#chat", :as => "chat"

# root :to => "users#new"
resources :users
resources :sessions

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
