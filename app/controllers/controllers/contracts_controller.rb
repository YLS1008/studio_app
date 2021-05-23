class ContractsController < ApplicationController

  before_action :set_params, only: [:new, :edit]
  before_action :authenticate_admin!

  def new
    @contract = Contract.new
  end

  def edit
    @contract = @activity.contract
  end

  def set
    Contract.create(contract_params)
    redirect_to calendar_path
  end

  def update
    activity = Activity.find(contract_params[:activity_id])
    contract = activity.contract
    contract.update(contract_params)

    redirect_to activity
  end

  private
  
  def set_params
    @activity = Activity.find(params[:id])
    @rates_arr = Contract.rate_types.keys
  end

  def contract_params
    params.require(:contract).permit(:activity_id, :rate, :rate_type)
  end



end
