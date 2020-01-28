Rails.application.routes.draw do
  devise_for :users
  get "home/about" => "homes#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :books
  resources :users
  resources :homes


  #.../todolists/1や.../todolists/3に該当する
  root to: "homes#index"

end

