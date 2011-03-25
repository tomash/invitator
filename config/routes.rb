Invitator::Application.routes.draw do

  devise_for :users

  root :to => "profile#new"
  resource :profile
end
