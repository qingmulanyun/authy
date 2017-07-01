Rails.application.routes.draw do
  root "sessions#root"
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :users, controller: "users", only: [:create, :show, :edit, :update] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  get "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  post "authy/verify" => "verify#verify"
  post "authy/send_token" => "verify#send_token_sms"
  post "authy/send_token_phone_call" => "verify#send_token_phone_call"
end
