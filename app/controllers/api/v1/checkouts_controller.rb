class Api::V1::CheckoutsController < ApplicationController
    before_action :authenticate_user!

    def create 
        Stripe.api_key = Rails.configuration.stripe[:secret_key]
    
        payment_link=Stripe::PaymentLink.create({
            line_items: [{
                price: 'price_1O3OmlSAGfg5TPND5ekkNvLy',
                quantity: 1,
            }],
            success_url: root_path
        })
        url=payment_link.url
        render json: {url: url}, status: :ok
    end 
end
