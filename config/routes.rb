ActionController::Routing::Routes.draw do |map|
  map.resources :account_schemes

  map.resources :pay_types
  map.summary '/payments/summary', :controller => 'payments', :action => 'summary'

  map.resources :payments, :belongs_to => :account

  map.resources :companies

  map.resources :departments

  map.resources :medical_schemes, :has_many => :rules

  map.resources :rules, :belongs_to => :medical_schemes

  map.resources :accounts, :belongs_to => :patient, :has_many => :payments
  map.resources :account, :belongs_to => :patient, :has_many => :payments

  map.resources :admissions

  map.resources :ward_types

  map.resources :drug_items

  map.resources :services

  map.resources :items, :belongs_to => :account, :belongs_to => :payments

	map.devise_for :users
	map.root :controller => "people"
	map.clinic  '/clinic', :controller => 'clinic', :action => 'index'
	map.create_remote  '/patient/create_remote',  :controller => 'people', :action => 'create_remote'
	map.admin  '/admin', :controller => 'admin', :action => 'index'
	map.login  '/login', :controller => 'sessions', :action => 'new'
	map.logout '/logout', :controller => 'sessions', :action => 'destroy'
	map.location '/location', :controller => 'sessions', :action => 'location'
	map.encounter '/encounters/new/:encounter_type', :controller => 'encounters', :action => 'new'  
	map.resource :session
	map.resources :dispensations, :collection => {:quantities => :get}
	map.resources :barcodes, :collection => {:label => :get}
	map.resources :relationships, :collection => {:search => :get}
	map.resources :programs, :collection => {:locations => :get, :workflows => :get, :states => :get}
	map.resources :encounter_types
	map.resources :single_sign_on, :collection => {:get_token => [:get, :post], :single_sign_in => [:get, :post]}
	map.connect ':controller/:action/:id.:format'
	map.connect ':controller/:action/:id'
	map.connect ':controller/:action/'
end
