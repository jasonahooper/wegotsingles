Wegotsingles::Application.routes.draw do
  root 'pages#home'

  devise_for :users, :controllers => {:registrations => "registrations"}
  devise_scope :user do
    get ":user_type/sign_up", :to => "registrations#new", :as => "account_registration"
  end

  resources :users, :only => [:show] do

    member do
      get :profile
    end

    resources :profiles, :only => [:show, :update, :edit]
  end

  resources :payments, :only => [:create, :new]
end
