class EnrollmentsController < ApplicationController
  
  before_action :set_trainee, only: [:cancel, :history]

  def enroll
    @trainees = Trainee.where(active: true)
    @time_slots = TimeSlot.all
    if params[:start_date].nil? then @start_date = Date.today.beginning_of_week else @start_date = params[:start_date] end
  end

  def finalize
    @slot = TimeSlot.find(params[:slot])
    monthly = if @slot.mother.contract_if_exists.rate_type == "monthly" then true else false end
    names_string = ""
    params[:trainee_ids].each do |id|
      next if id == ''

      if monthly
        Enrollment.enroll_to_group(@slot, id)
      else
        Enrollment.create!(trainee_id: id, time_slot_id: @slot.id)
      end

    end

    redirect_back(fallback_location: enroll_path)

  end

  def cancel
    slot = TimeSlot.find(params[:slot_id])
    if slot.mother.contract_if_exists.rate_type == 'monthly'
      Enrollment.cancel_group_enrollment(slot.mother.id, @trainee.id)
    else
      enrollment = Enrollment.where(trainee_id: @trainee.id, time_slot_id: slot.id)
      unless enrollment.first.destroy
        flash[:alert] = 'השיעור ננעל על ידי מנהל, לא ניתן לשנות את הרישום לשיעור.'
      end
    end
    redirect_back(fallback_location: @trainee)
  end

  def enroll_child
    @trainee = Trainee.find(params[:id])
    @trainee_child = Trainee.new
  end

  def create_child
    parent = Trainee.find(enroll_params[:parent_id])
    if enroll_params["email"].empty? then enroll_params["email"] = parent.email end
    if enroll_params["phone"].empty? then enroll_params["phone"] = parent.email end
    child_trainee = Trainee.create(enroll_params)
    redirect_to child_trainee
  end

  def history
    trainee_enrollments = Enrollment.where(trainee_id: @trainee.id).pluck(:time_slot_id)
    @past_time_slots = TimeSlot.find(trainee_enrollments).select {|x| x.start_time.to_date < Date.today}
  end



  private
  def enroll_params
    params.require(:trainee).permit(:email, :first, :last, :phone, :parent_id)
  end

  def set_trainee
    @trainee = Trainee.find(params[:trainee_id])
  end
end
