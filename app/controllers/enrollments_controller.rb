class EnrollmentsController < ApplicationController
  
  before_action :set_trainee, only: [:cancel, :history]


  def enroll
    @trainee = Trainee.find(params[:id])
    @trainee_enrollment = @trainee.enrollments
    @time_slots = TimeSlot.all
  end

  def finalize
    @slot = TimeSlot.find(params[:slot_id])
    if ["per_head", "gradient", "hourly", "undefined"].include? @slot.mother.contract_if_exists.rate_type
      @enrollment = Enrollment.new(trainee_id: params[:trainee_id], time_slot_id: params[:slot_id])
      if @enrollment.save
        redirect_back(fallback_location: enroll_path(id: params[:trainee_id]))
      else
        flash[:alert] = "השיעור ננעל על ידי מנהל, לא ניתן לשנות את הרישום לשיעור."
        redirect_to calendar_path
      end
    elsif @slot.mother.contract_if_exists.rate_type == "monthly"
       Enrollment.enroll_to_group(@slot.mother.id, params[:trainee_id])
       redirect_back(fallback_location: enroll_path(id: params[:trainee_id]))
    end
  end

  def cancel
    slot = TimeSlot.find(params[:slot_id])
    if slot.mother.contract_if_exists.rate_type == "monthly"
      enrollment = Enrollment.cancel_group_enrollment(trainee_id: @trainee.id, activity_id: slot.mother.id)
      redirect_back(fallback_location: @trainee)
    else
      enrollment = Enrollment.where(trainee_id: @trainee.id, time_slot_id: slot.id)
      if enrollment.first.destroy
        redirect_back(fallback_location: @trainee )
      else
        flash[:alert] = "השיעור ננעל על ידי מנהל, לא ניתן לשנות את הרישום לשיעור."
        redirect_back(fallback_location: @trainee)
      end
    end
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

  def enroll_via_slot
    @trainees = Trainee.where(active: true)
    @slot = TimeSlot.find(params[:id])
  end

  def finalize_for_slot
    updated_enrollments_ids = params[:time_slot][:trainee_ids].select {|x| !x.empty? }
    updated_enrollments_ids.each do |x|
      Enrollment.find_or_create_by(trainee_id: x.to_i, time_slot_id: params[:id] )
    end
    redirect_to admin_root_path
  end


  private
  def enroll_params
    params.require(:trainee).permit(:email, :first, :last, :phone, :parent_id)
  end

  def set_trainee
    @trainee = Trainee.find(params[:trainee_id])
  end
end
