class StaticPagesController < ApplicationController
  require 'flickraw-cached'

  FlickRaw.api_key       = ENV["API_KEY"]
  FlickRaw.shared_secret = ENV["SHARED_SECRET"]
  
  def home
    unless params[:flickr_id].empty?
      @flickr_id = params[:flickr_id]      
    else
      @flickr_id = "164733158@N08"
    end
    
    @album   = flickr.photos.search(:user_id => @flickr_id)
  end
  
end
