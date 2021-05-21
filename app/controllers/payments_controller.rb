class PaymentsController < ApplicationController

  def index
    @need_to_pay = Trainee.all.select {|t| t.payment_status < 0}
    @past_payments = Payment.all
    @monthly_activities = Activity.find(Contract.where(rate_type: 'monthly').pluck(:activity_id))
  end

  def pay
    Payment.create(trainee_id: params[:trainee][:id], number_of_tickets: params[:trainee][:ticket])
    redirect_back(fallback_location: payments_index_path)
  end

  def refund
    Payment.find(params[:id]).destroy
    redirect_back(fallback_location: payments_index_path)
  end

  def monthly_payment
    if payment_params[:status] == "true"
      MonthlyPayment.where(trainee_id: payment_params[:trainee_id], activity_id: payment_params[:activity_id], month: Date.today.month ).first.destroy
    else
      MonthlyPayment.create(trainee_id: payment_params[:trainee_id], activity_id: payment_params[:activity_id], month: Date.today.month)
    end
    redirect_back(fallback_location: payments_index_path)
  end

    private
    
    def payment_params
      params.permit(:trainee_id, :activity_id, :status)
    end
end
