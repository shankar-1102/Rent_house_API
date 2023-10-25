class Api::V1::CheckoutsController < ApplicationController
    before_action :authenticate_user!
 


    def create 
        Stripe.api_key = Rails.configuration.stripe[:secret_key]
        @customer=Stripe::Customer.create({

        }),
        @session=Stripe::Checkout::Session.create({

        })
    end 

end
