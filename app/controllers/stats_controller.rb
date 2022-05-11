class StatsController < ApplicationController
    def show
        @stat = Url.find_by(shortcode: params[:shortcode])

        if !@stat.nil?
            render json: @stat, serializer: StatsUrlSerializer, status: :ok 
        else
            render json: { data: { message: "shortcode can not be found in the system" } } , status: :not_found
        end
    end
end
