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

      names_string + ' ,' + Trainee.find(id).full_name
      if monthly
        Enrollment.enroll_to_group(@slot.mother.id, id)
      else
        Enrollment.create!(trainee_id: id, time_slot_id: @slot.id)
      end

    end
    flash[:notice] = 'בוצע רישום של' + names_string + ' לשיעור' +
        @slot.mother.name + ' בתאריך' + @slot.start_time.strftime("%d / %m / %y")
    redirect_back(fallback_location: enroll_path)

  end

  def cancel
    slot = TimeSlot.find(params[:slot_id])
    if slot.mother.contract_if_exists.rate_type == 'monthly'
      Enrollment.cancel_group_enrollment(trainee_id: @trainee.id, activity_id: slot.mother.id)
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
