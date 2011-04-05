Invitator::Application.routes.draw do

  devise_for :users

  root :to => "dashboards#show"
  resource :profile
  resources :invitations do
    member do
      get :accept
      get :decline
    end
  end
end
