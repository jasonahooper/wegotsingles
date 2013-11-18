Wegotsingles::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", }
  devise_scope :user do
    get ":user_type/sign_up", :to => "registrations#new", :as => "account_registration"
  end
  root 'pages#home'

  resources :users, :only => [:show] do
    resources :profiles, :only => [:show]
  end
end
