ArctcFox::Application.routes.draw do
  get "events/index"
  get "event/index"

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
                     controllers: {omniauth_callbacks: "omniauth_callbacks",
                     registrations: "users/registrations" }

  #static content
  
  get '/' => 'pages#index'
  get "pages/events"
  get 'feeds_all' => 'pages#feeds'

  #end static content


  post "reading_articles/read"
  post "reading_articles/like"
  get "feeds/index"
  get "feed/index"

  resources :feeds
  resources :users
  get 'friends' => 'users#friends'

  resource :articles
  resources :subitems
  
  resources :events
  resources :notifications

  get 'reading_articles/reset_all' => 'reading_articles#reset_all'

  get 'reading_articles/:id/like' => 'reading_articles#like'
  get 'reading_articles/:id/read' => 'reading_articles#read'

  post 'relationships' => 'relationships#create'

  #messages
  post 'messages' => 'messages#send_message'
  get 'messages/recieved' => 'messages#recieved'
  get 'messages/recieved/read' => 'messages#mark_all_as_read'
  delete 'messages/:id' => 'messages#destroy'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
  