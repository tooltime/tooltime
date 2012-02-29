class ApplicationController < ActionController::Base
  protect_from_forgery
  http_basic_authenticate_with :name     => ENV['BASIC_AUTH_USERNAME'],
                               :password => ENV['BASIC_AUTH_PASSWORD'] if Rails.env == 'production'
  
  private
  
  def sorted_collection(collection)
    if params[:sort].nil? || params[:order].nil?
      collection
    else
      collection.respond_to?(:order) ? sorted_collection_relation(collection) : sorted_collection_array(collection)
    end
  end
  
  def sorted_collection_relation(collection)
    collection.order("#{params[:sort]} #{params[:order].upcase}")
  end
  
  def sorted_collection_array(collection)
    if params[:order] == 'asc'
      collection.sort {|a,b| a.attributes[params[:sort]] <=> b.attributes[params[:sort]] }
    elsif params[:order] == 'desc'
      collection.sort {|a,b| b.attributes[params[:sort]] <=> a.attributes[params[:sort]] }
    end
  end
end
