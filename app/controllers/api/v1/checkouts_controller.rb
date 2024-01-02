class Api::V1::CheckoutsController < ApplicationController
    before_action :authenticate_user!

    def create 
        payment_service = PaymentService.new(current_user)
        url = payment_service.create_payment_link
        render json: {url: url}, status: :ok
    end 
end
