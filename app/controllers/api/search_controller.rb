# -*- coding: utf-8 -*-
class Api::SearchController < ApplicationController

  require 'uri'
  require 'net/http'
  require 'json'

  def now_where
    request_geocoding(now_where_params[:latitude], now_where_params[:longitude])
  end

  def practice

  end

  private
  
  def now_where_params
    params.require(:point).permit(:latitude, :longitude)
  end

  def request_geocoding(latitude, longitude)
    uri = URI("http://maps.google.com/maps/api/geocode/json?latlng=#{latitude},#{longitude}&sensor=false")
    res = Net::HTTP.get_response(uri)
    json = res.body
    result = JSON.parse(json)
  end
  
end
