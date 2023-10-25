class Api::V1::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:show]
    
    def index 
        @user = User.all 
        render json: @users, status: :ok 
    end 
    def show 
        render json: @user , status: :ok
    end 

    def update 
        if current_user.update(user_params)
            render json: current_user, status: :ok 
        else 
            render json: {data: current_user.errors.full_messages, status: "failed"},status: :unprocessable_entity
        end 
    end

    def destroy
       
        if current_user.destroy 
            render json: {data: 'user deleted successfully', status: 'success'},status: :ok
        else 
            render json: {data: 'something went wrong',status: 'failed' }
        end 
    end 

    private 
    def set_user 
        @user = User.find(params[:id])
        rescue ActiveRecord::RecordNotFound => error 
         render json: {error: error.message},status: :unauthorized
    end

    def user_params
        params.require(:user).permit(:id, :email, :name, :role, :password) 
    end  
end
