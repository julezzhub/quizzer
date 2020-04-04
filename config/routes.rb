Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :rooms, only: [:index, :show, :new, :create] do
    resources :games, only: [:new, :create, :show]
  end

  patch "rooms/:id/ready", to: "rooms#ready"
  get "leaveroom", to: "rooms#leave_room"
end
