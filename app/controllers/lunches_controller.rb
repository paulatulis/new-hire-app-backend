class LunchesController < ApplicationController
	require 'rest-client'
  	API_KEY = "5OOB_T83R6wvIwBFSKGfiGtYRN9A5zNNtoFYlk7d5eSyBsG1nfvKdeqXLT11MbT9Ex0sRb9VSuqSHD8Ff0z-JX6NjcryGVOS8m83ADQonaOBDI-ktzHDypA7oHQvXXYx"
  	API_HOST = 'https://api.yelp.com'
  	BUSINESS_PATH = '/v3/businesses/search'
  	SEARCH_TERM = '?location=Atlanta&limit=10'

  	def get_yelp
		business_path = BUSINESS_PATH + SEARCH_TERM
		url = API_HOST + business_path
		headers = {'Authorization': "Bearer #{API_KEY}"}
		response = RestClient.get(url, headers=headers)
		render json: response
	  end
	  
	def create
		@lunch = Lunch.new(lunch_params)
		@user = User.find(lunch_params[:user_id])
		

		if @lunch.save
			render json: @user, each_serializer: UserSerializer.new(@user), status: :accepted
		else
			render json: { errors: (@lunch.errors) }, status: :unprocessable_entity
		end
	end

	def destroy
		@lunch = Lunch.find(params[:id])
		@user = User.find(lunch_params[:user_id])

		if @lunch
			@lunch.destroy

			render json: @user, each_serializer: UserSerializer.new(@user), status: :ok
		else
			render json: { errors: ["Lunch of id #{params[:id]} not found."] }, status: :not_found
		end
	end

	private
	def lunch_params
        params.require(:lunch).permit(:user_id, :colleague_id, :location, :address, :name, :photo, :yelp_info, :date)
	end

end
