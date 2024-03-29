LauncherApp::Application.routes.draw do


  

  get "users/create"

  get "pages/home"
  get "pages/contact"
  get "pages/about"

  root :to => "admins#new"
  
  resources :admins
  resources :websites, :only => [:show, :edit, :update]
  resources :users, :only => [:create]
  resources :sessions, :only => [:new, :create, :destroy]
  match '/followers', :to => 'websites#followers'
  match '/csv', :to => 'websites#csv'
  match '/signup', :to => 'admins#new'
  match '/signin', :to => 'sessions#new'
	match '/signout', :to => 'sessions#destroy'
	match '/confirm/:confirmation_code', :to => 'users#confirm'
	post '/invite', :to => 'invitations#invite'
	match ':url' => 'websites#show', :constraints => { :subdomain => /.+/ }  
	match ':url' => 'websites#show'
	
	namespace :api do
		namespace :v1 do
			get '/invited' => 'invites#show'
		end
	end

	
 

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
