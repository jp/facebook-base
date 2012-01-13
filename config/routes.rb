ResnFacebook::Application.routes.draw do
  get "home/index"



  root :to => "home#index"
  
  resource :facebook, :except => :create do
    get :callback, :to => :create
  end

  resource :dashboard, :only => :show

  match "/user" => "users#details"
  match "/user/position/:pos" => "users#updatePosition"
  match "/user/friends" => "users#friends"

  match "/event/:id/attending" => "events#attending"
  match "/event/:id/maybe" => "events#maybe"
  match "/event/:id/declined" => "events#declined"


end
