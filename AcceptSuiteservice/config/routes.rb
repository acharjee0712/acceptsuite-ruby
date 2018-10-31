Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "acceptsuite/acceptJs" => "acceptsuites#acceptJs" 
  get "acceptsuite/acceptUI" => "acceptsuites#acceptUI" 
  get "acceptsuite/acceptHosted" => "acceptsuites#acceptHosted" 
  get "acceptsuite/acceptCustomer" => "acceptsuites#acceptCustomer"
  get "acceptsuite/validateCustomer" => "acceptsuites#validateCustomer"  
end
