class UsersController < ApplicationController
    # skip_before_action :authorize, only: [:index, :create]
  
    def index
        @users = User.all
        render json: @users, each_serializer: UserSerializer
    end 

    def show
        @user = User.find(params[:id])

        if @user 
            render json: {user: UserSerializer.new(@user)}, status: :ok
        else
            render json: {errors: ['User not found.']}, status: :not_found
        end 
    end

    def create
        @user = User.new(user_params)

        if @user.save
            token = jwt_encode({user_id: @user.id})
            render json: {token: token, user: UserSerializer.new(@user)}, status: :ok
        else 
            render json: {errors: (@user.errors.full_messages)}, status: :unprocessable_entity
        end 
    end 

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            render json: {user: UserSerializer.new(@user) }, status: :accepted
        else
            render json: {errors: @user.errors.full_messages}, status: :declined
      end
    end 

   private 
   
   def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :email, :photo, :team, :title, :bio, :start_date, :location, :manager)
   end 


end
