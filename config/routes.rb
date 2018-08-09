Rails.application.routes.draw do 
  namespace :api, defaults: { format: :json } do 
    namespace :v1 do 
    	post '/weather', to: "weather#search"
    end 
  end 
end