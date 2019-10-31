class PaymentsController < ApplicationController
    before_action :authenticate_user!
    # before_action :set_payment, only: [:show, :edit, :update]
end