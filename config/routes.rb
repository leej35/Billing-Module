ActionController::Routing::Routes.draw do |map|
  map.resources :pay_types  
  map.summary '/payments/summary', :controller => 'payments', :action => 'summary'
  map.resources :payments, :belongs_to => :account
  map.resources :companies
  map.resources :accounts, :belongs_to => :patient, :has_many => :payments
  map.resources :types
  map.resources :rules, :belongs_to => :medical_schemes
  map.resources :account, :belongs_to => :patient
  map.resources :patient, :has_one => :account
  map.resources :medical_schemes, :has_many => :rules
  map.resources :tests
  map.resources :departments
  map.resources :account_item_lists
  map.resources :account_schemes
  map.resources :ward_types
  map.resources :drug_items
  map.resources :services
  map.resources :scheme_providers
  map.resources :items
  map.resources :admissions
  map.devise_for :users
  map.root :controller => "people"
  map.clinic  '/clinic',  :controller => 'clinic', :action => 'index'
  map.create_remote  '/patient/create_remote',  :controller => 'people', :action => 'create_remote'
  map.admin  '/admin',  :controller => 'admin', :action => 'index'
  map.login  '/login',  :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.location '/location', :controller => 'sessions', :action => 'location'
  map.encounter '/encounters/new/:encounter_type', :controller => 'encounters', :action => 'new'  
  
  map.resource :session
  map.resources :dispensations, :collection => {:quantities => :get}
  map.resources :barcodes, :collection => {:label => :get}
  map.resources :relationships, :collection => {:search => :get}
  map.resources :programs, :collection => {:locations => :get, :workflows => :get, :states => :get}
  map.resources :encounter_types
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/'
end
