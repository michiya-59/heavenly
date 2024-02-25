# frozen_string_literal: true

Rails.application.routes.draw do
  get "learns/index"
  get "learns/edit"
  get "admins/index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  resources :learn_categories, only: %i(index create edit update destroy)
  resources :learns, only: %i(index create edit update destroy)
end
