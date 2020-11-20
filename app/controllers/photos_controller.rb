include Response
require 'uri'
require 'net/http'

class PhotosController < ApplicationController
  def index
    page = params[:page].length > 0 ? params[:page] : 1
    per_page = params[:per_page].length > 0 ? params[:per_page] : 10

    url = URI("https://www.flickr.com/services/rest/?
          method=flickr.photos.search&
          api_key=8a127f3f507ce1c4f302bc17a64dd455&extras=&
          per_page=#{per_page}&
          page=#{page}&
          format=json&
          tags=bikes,bike,bicycle,bikerace&
          nojsoncallback=1")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)

    json_response(response.read_body)
  end
end