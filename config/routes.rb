Rails.application.routes.draw do

  devise_for :users, :path => 'accounts'
  resources :users do
  	resources :boards do
  		resources :pins
  	end
  end
  root 'boards#index'
end
