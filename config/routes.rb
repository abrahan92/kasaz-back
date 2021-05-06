# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  default_url_options :host => "http://192.168.1.143:3030"

  namespace :api do
    namespace :v1 do
      # Properties endpoints
      resources :properties
    end
  end
end
