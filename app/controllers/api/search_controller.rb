# -*- coding: utf-8 -*-
class Api::SearchController < ApplicationController

  protect_from_forgery with: :null_session
  
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

    # リファクタリング必要あり
    uri = URI("http://maps.google.com/maps/api/geocode/json?latlng=#{latitude},#{longitude}&sensor=false&language=ja")
    res = Net::HTTP.get_response(uri)
    json = res.body
    result = JSON.parse(json)
    hash = Hash.new
    i = 0
    result['results'].each_with_index do |v, k|
      v.each_with_index do |v2, k2|
        hash[i] = v2[1]
        i += 1
      end
      break
    end
    @area_name = hash[0].map { |e| e["long_name"] }
    sql = District.create_sql_search_name(@area_name)
    district_result = Hash.new
    sql.each_with_index do |v, k|
      results = ActiveRecord::Base.connection.select(v)
      results.each_with_index do |v2, k2|
        district_result = v2
      end
    end
    @shops = Shop.where(:district_id => district_result["id"])
    render :json => {result: @shops}
  end
  
end
