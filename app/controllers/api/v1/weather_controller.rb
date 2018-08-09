# app/controllers/api/v1/weather_controller.rb 
require 'rest-client'
require 'json'

class Api::V1::WeatherController < Api::V1::BaseController 
    def search 
        puts params
        response = RestClient.get("https://api.darksky.net/forecast/#{ENV['key']}/42.3601,-71.0589")
        # puts "Code: #{response.code}"
        
        # Change String to JSON
        result = JSON.parse(response.body)
        p result["daily"]["summary"]
        render json: {
            "weather": result
        }
    end 
end