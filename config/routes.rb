Rails.application.routes.draw do
  resources :person_names
  resources :person_attribute_types
  resources :person_attributes
  resources :person_addresses
  resources :patient_identifier_types
  resources :patient_identifiers
  resources :global_properties
  resources :people do
  	collection do
  		post :start
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
