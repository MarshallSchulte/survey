Rails.application.routes.draw do
  
  resources :metric_scores

  resources :graphs
  
  resources :user_invites

  resources :reviewer_types

  resources :reviewers

  resources :responses

  resources :questions

  resources :kpis

  resources :metrics do
    resources :kpis
  end

  resources :vtypes
  resources :static

  resources :ctypes

  resources :vendors do
    collection { post :import }
  end

  resources :customers do
    collection do
      get 'check_email'
    end
    collection { post :import }
  end

  resources :campaigns do
    put :send_campaign, on: :member
    put :confirm, on: :member
    put :on_hold, on: :member
    put :drafted, on: :member
    put :save_survey, on: :member
    get :results, on: :member
    get :survey_progress, on: :member
    get :graph_1, on: :member
    get :graph_2, on: :member
    get :graph_3, on: :member
    get :send_to_graphs, on: :member
    get :send_to_graphs_2, on: :member
    get :send_to_graphs_3, on: :member
    get :send_to_graphs_5, on: :member
    get :send_to_ma_graphs, on: :member
    get :send_to_ma_graphs_2, on: :member
    get :send_to_ma_graphs_3, on: :member
    get :send_to_ma_graphs_4, on: :member
    get :send_to_ma_graphs_5, on: :member
    get :remove_all, on: :member
    get :remove_from_graphs, on: :member
    get :powerpoint, on: :member
    get :export_spreadsheet, on: :member
    collection { post :import }
  end
  
  namespace :dynamic_select do
    get ':metric_id/kpis', to: 'kpis#index', as: 'kpis'
  end
  
  

  #devise_for :users, :controllers => { registrations: 'registrations' }
  devise_for :users, :controllers => {:registrations => "registrations",:invitations => 'users/invitations'}
  
  devise_scope :user do
    match '/login', to: "devise/sessions#new", via: 'get'
    match '/campaign_manager_signup', to: "registrations#new", via: 'get'
    match '/specialist_registration', to: "registrations#new_specialist", via: 'get'
    match '/admin_registration', to: "registrations#new_admin", via: 'get'
    match '/logout', to: "devise/sessions#destroy", via: 'get'
    resources :users do
      put :deactivate, on: :member
      collection do
        get 'check_email'
      end
    end
  end
  
  root to: 'static#home'

  match '/contact', to: "static#contact", via: "get"

  match '/about', to: "static#about", via: "get"
  
  match '/admin_landing', to: "static#admin_landing", via: "get"
  match '/campaign_manager_landing', to: "static#campaign_manager_landing", via: "get"
  match '/load_chart', to: "static#load_chart", via: "get"
  
  match '/specialist_landing', to: "static#specialist_landing", via: "get"
  
  match '/survey(/:id)', to: "campaigns#survey", via: "get"
  match '/add_reviewers/:id', to: "campaigns#add_reviewers", via: "get"
  
  match '/invite_user', to: "static#invite_user", via: "get"
  
  get 'static/testimonials'
  
  get 'resend_invite(/:id)' => 'customers#resend_invite'
  
  get 'send_to_reviewers(/:id)' => 'campaigns#send_to_reviewers'
  
  get 'resend_survey(/:id)' => 'campaigns#resend_survey'
  
  match 'unauthorized' => 'static#unauthorized', via: "get"
  
  match 'performance(/:id)', to: "metric_scores#performance", via: "get"
  
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
