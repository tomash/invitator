Invitator::Application.routes.draw do

  devise_for :users

  root :to => "dashboards#show"
  resource :profile
  resources :invitations
end
