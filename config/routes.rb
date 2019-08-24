Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"
  
  resources :users
  resources :versions do
    member do
      get :fire_job_one
    end
    collection do
      get 'fire_job_2/:id' => :fire_job_2, as: 'versions_fire_job_2'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
