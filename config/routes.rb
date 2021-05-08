# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  default_url_options :host => ENV['HOST_URL']

  namespace :api do
    namespace :v1 do
      # Properties endpoints
      resources :properties do 
        collection do
          get 'filters'
        end
      end
    end
  end
end
