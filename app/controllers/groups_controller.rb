class GroupsController < ApplicationController
  def index
    @activities = Activity.where(payment: "monthly")

  end

  def show
  end

  def cancel
  end

  def destroy
  end

  def change_status
  end
end
