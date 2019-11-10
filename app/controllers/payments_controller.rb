class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]

    # def show #(success screen)
    #     @user = User.find(params[:id])
    # end

    def success

    end

    # def show

    # end

    def webhook
        payment_id = params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        listing_id = payment.metadata.listing_id
        user_id = payment.metadata.user_id
        order = Payment.new(
            user_id: user_id,
            listing_id: listing_id,
            stripe_id: payment_id,
            price: params[:data][:object][:display_items][0][:amount]
        )

        unless order.save
            puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
            puts params
            puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        else
            puts "Order #{order.id} successfully created"
        end
    end
end