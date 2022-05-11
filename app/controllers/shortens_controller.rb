class ShortensController < ApplicationController
  require 'net/http'

  def show
    @shorten = Url.find_by(shortcode: params[:shortcode])

    if !@shorten.nil?
      @shorten.update(redirectCount: @shorten.redirectCount + 1, lastSeenDate: Time.now)
      uri = URI.parse(@shorten.url)
      response = Net::HTTP.get_response(uri)

      return render json: response.header
    else
      return render json: {
        data: { 
          message: "shortcode cannot be found in the system" 
          }
        }, status: 404

    end


  end

  def create
    @shorten = Url.new(shorten_params)
    @shorten.startDate = Time.now
    @existing_shortcode = Url.find_by(shortcode: params[:shortcode])

    if @shorten.shortcode.blank?
      @shorten.shortcode = (rand(9).to_s + ('a'..'z').to_a.shuffle[0,2].join + ('A'..'Z').to_a.shuffle[0,2
      ].join + "_".split('').shuffle[0,2].join)
    end

    if @shorten.url.blank?
      return render json: {
        data: { 
          message: "url is not present" 
          }
        }, status: 400
    end

    if !@existing_shortcode.nil?
      return render json: {
        data: {
          message: "the desired shortcode is already in use."
          }
        }, status: 409
    end

    if @shorten.shortcode.match(/^[0-9a-zA-Z_]{4,}$/).nil?
      return render json: {
        data: {
          message: "the shortcode fails to meet the requirements"
          }
        }, status: 422
    end

    render json: @shorten, status: :created if @shorten.save

  end

  private
    def shorten_params
      params.require(:shorten).permit(:url, :shortcode)
    end
end
