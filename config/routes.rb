# -*- encoding : utf-8 -*-
Erhuamao::Application.routes.draw do
  
  resources :questions

  resources :galleries

  resources :gbookings

  resources :bookings

  resources :brochure_destinations

  resources :brochure_interests

  resources :brochure_travels

  resources :brochures

  resources :pages

  resources :presses

  resources :events

  resources :photos

  resources :travels do 
    resources :itineraries
    resources :datesprices
  end

  resources :destinations do
    resources :travels
  end

  resources :interests do
    resources :travels
  end

  resources :specialoffers

  resources :itineraries
  resources :datesprices

  devise_for :users
  as :user do
    get 'login' => 'devise/sessions#new', :as => :new_user_session
    post 'login' => 'devise/sessions#create', :as => :user_session
    match 'logout' => 'devise/sessions#destroy', :as => :destroy_user_session#, :via => Devise.mappings[:user].sign_out_via
    get 'signup' => 'devise/registrations#new', :as => :new_user_registration
    post 'signup' => 'devise/registrations#create', :as => :user_registration
    put 'signup' => 'devise/registrations#update'
    get "setting", :to => "users#setting"
    put "update_setting", :to => "users#update_setting"
    put "update_password", :to => "users#update_password"
    put "update_avatar", :to => "users#update_avatar"
    get "/users/:id", :to => "users#show", :as => :user # 对外的访问主页，也可作为自己的主页，尚有待完善，字段是否使用login?
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
  namespace :admin do
    #root :to => "admin#index"
    resources :users do
      member do
        get :lock, :unlock, :generate_new_password_email
      end
    end
    resources :travels do 
      member do
        get :new_destination_travel
        post :create_destination_travel
        get :new_interest_travel
        post :create_interest_travel
        get :new_specialoffer_travel
        post :create_specialoffer_travel
        get :new_brochure_travel
        post :create_brochure_travel
      end
      resources :itineraries
      resources :datesprices
    end
    resources :datesprices
    resources :itineraries
    resources :destinations do
      resources :galleries
      member do
        get :new_brochure_destination
        post :create_brochure_destination
      end
    end
    resources :interests do
      member do
        get :new_brochure_interest
        post :create_brochure_interest
      end
    end
    resources :hotels do
      resources :galleries
    end
    resources :photos
    resources :specialoffers
    resources :presses
    resources :events
    resources :pages
    resources :banners
    resources :brochures
    resources :galleries do 
      resources :photos
    end
    resources :bookings
    resources :gbookings
    resources :questions
  end

  match "weibo_login" => "welcome#weibo_login"
  match "weibo_callback" => "welcome#weibo_callback"

  match "admin/travels/:id/destroy_destination_travel/:destination_id" => "admin/travels#destroy_destination_travel"
  match "admin/travels/:id/destroy_interest_travel/:interest_id" => "admin/travels#destroy_interest_travel"
  match "admin/travels/:id/destroy_specialoffer_travel/:specialoffer_id" => "admin/travels#destroy_specialoffer_travel"
  match "admin/travels/:id/destroy_brochure_travel/:brochure_id" => "admin/travels#destroy_brochure_travel"
  match "admin/interests/:id/destroy_brochure_interest/:brochure_id" => "admin/interests#destroy_brochure_interest"
  match "admin/destinations/:id/destroy_brochure_destination/:brochure_id" => "admin/destinations#destroy_brochure_destination"
  get 'admin' => 'admin/base#index'
  get 'admin/handle' => 'admin/base#handle'
  get 'search' => 'welcome#search'

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id(.:format)))'
end
