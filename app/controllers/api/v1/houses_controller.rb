class Api::V1::HousesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_house ,only: [:show, :update, :destroy]

    def index 
        @houses=House.all 
        render json: @houses, status: :ok 
    end 
    def show 
        # @house=House.find(params[:id])
        render json: @house ,status: :ok
    end 
    def create 
        @house= current_user.houses.new(house_params)
        if @house.save 
            render json: @house, status: :ok 
        else 
            render json: {data: @house.errors.full_messages, status: "failed"},status: :unprocessable_entity 
        end 
    end 
    def update 
        # @house=House.find(params[:id])
        if @house.update(house_params)
            render json: @house ,status: :ok 
        else 
            render jason: {data: @house.errors.full_messages, status: "failed"},status: :unprocessable_entity
        end
    end 
    def destroy 
        # @house=House.find(params[:id])
        if @house.destroy 
            render json: {data: 'house deleted successfully', status: 'sucess'}, status: :ok
        else 
            render json: {data: 'something went wrong',status: 'failed'}
        end
    end 

    private 
    def set_house
        @house = current_user.houses.find(params[:id])      
        if @house.nil?
          render json: { error: "House not found" }, status: :not_found
        end
      rescue ActiveRecord::RecordNotFound => error
        render json: { error: error.message }, status: :unauthorized
      end

    def house_params
        params.require(:house).permit(:name, :location, :image_url, :price_for, :available_for, :amount ,:status)
    end
end