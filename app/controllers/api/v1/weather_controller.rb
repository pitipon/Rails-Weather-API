# app/controllers/api/v1/weather_controller.rb 
require 'rest-client'
require 'json'

class Api::V1::WeatherController < Api::V1::BaseController 
    def search 
        puts params["longitude"]
        url = "https://api.darksky.net/forecast/#{ENV['WEATHER_KEY']}/#{params["latitude"]},#{params["longitude"]}"
        p url
        response = RestClient.get(url)
        # puts "Code: #{response.code}"
        
        # Change String to JSON
        result = JSON.parse(response.body)
        p result["daily"]["summary"]
        render json: {
            "weather": result
        }
    end 
end