# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    post 'auth/login' => 'authentication#login'

    resources :users, only: %i[index create update show] do
      collection do
        get :current
      end
    end
  end
end
