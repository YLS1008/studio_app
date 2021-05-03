class PaymentsController < ApplicationController

  def index
    @need_to_pay = Trainee.all.select {|t| t.payment_status < 0}
    @past_payments = Payment.all
  end

  def pay
    Payment.create(trainee_id: params[:trainee][:id], number_of_tickets: params[:trainee][:ticket])
    redirect_back(fallback_location: payments_index_path)
  end

  def refund
  end
end
