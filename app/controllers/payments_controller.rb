class PaymentsController < ApplicationController
    before_action :authenticate_user!
    # before_action :set_payment, only: [:show, :edit, :update]
    skip_before_action :verify_authenticity_token, only: [:webhook]

    def show #(success screen)
        @user = User.find(params[:id])
    end

    def success

    end

    def webhook
        p params

        payment_id= params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        listing_id = payment.metadata.listing_id
        user_id = payment.metadata.user_id

    p "listing id " + listing_id
    p "user id " + user_id

    status 200
    end
end