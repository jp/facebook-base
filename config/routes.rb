ResnFacebook::Application.routes.draw do
  get "home/index"

  root :to => "home#index"
  
  resource :facebook, :except => :create do
    get :callback, :to => :create
  end

  resource :dashboard, :only => :show

end
