class Api::V1::FeedbacksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_feedback, only: [:create, :update, :destroy]
    def index 
        @feedbacks = Feedback.all
        render json: @feedbacks
    end 

    def show 
        @feedback=Feedback.find(params[:id])
        render json: @feedback 
    end 

    def create
        @feedback=@house.feedbacks.create(feedback_params)   
        if @feedback.save 
            render json: @feedback, status: :ok 
        else 
            render json: {data: @feedback.errors.full_messages, status: "failed"}, status: :unprocessable_entity  
        end   
    end 

    def update 
        @feedback=@house.feedbacks.find(params[:id])
        if @feedback.update(feedback_params)
            render json: @feedback, status: :ok 
        else 
            render json: {data: @feedback.errors.full_messages, status: "failed"}, status: :unprocessable_entity
        end 
    end

    def destroy 
        @feedback=@house.feedbacks.find(params[:id])
        if @feedback.destroy 
            render json: {data: 'deleted Successfully',status: 'success'}, status: :ok 
        else 
            render jsaon: {data: 'something went wrong', status: 'failed'}
        end 
    end 

    private 

    def set_feedback 
        @house = current_user.houses.find_by(params[:id])
    end 
    def feedback_params
        params.require(:feedback).permit(:feedback, :rating, :user_id)
    end 
end 
