Rails.application.routes.draw do
  root to: 'users#index'

  # Users resource
  resources :users do
    # P5 History Route
    resources :rewards, only: [:index,:new, :create]
    get 'p5', to: 'users#p5_history', as: 'p5_history'
    

  end

end
