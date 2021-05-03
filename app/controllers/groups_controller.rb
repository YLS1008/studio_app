class GroupsController < ApplicationController
  def index
    @activities = Activity.where(payment: "monthly")
  end

  def show
  end

  def cancel
    Group.where(activity_id: params[:activity_id], trainee_id: params[:id]).destroy
    redirect_back(fallback_location: groups_path)
  end

  def destroy
  end

  def change_status
    Group.where(activity_id: params[:activity_id], trainee_id: params[:id]).update(status: "payed")
    redirect_back(fallback_location: groups_path)
  end
end
