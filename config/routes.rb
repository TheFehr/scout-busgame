# frozen_string_literal: true

Rails.application.routes.draw do
  get 'permit_buys/create'
  get 'plan/index'

  post 'occupation', to: 'occupations#create'
  post 'permit_buys', to: 'permit_buys#create'
  put  'zone', to: 'zones#update'
  put  'permit_buys', to: 'permit_buys#update'

  resources :groups
  resources :permit_prices

  root 'home#index'
end
