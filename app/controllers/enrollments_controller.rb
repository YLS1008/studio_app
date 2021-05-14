class EnrollmentsController < ApplicationController
  
  before_action :set_trainee, only: [:cancel, :history]


  def enroll
    @trainee = Trainee.find(params[:id])
    @trainee_enrollment = @trainee.enrollments
    @time_slots = TimeSlot.all
  end

  def finalize
    @slot = TimeSlot.find(params[:slot_id])
    if @slot.mother.payment == "entry"
      @enrollment = Enrollment.new(trainee_id: params[:trainee_id], time_slot_id: params[:slot_id])
    else
       @enrollment = Group.new(activity_id: @slot.mother.id, trainee_id: params[:trainee_id], status: "unpayed")
    end
    
    if @enrollment.save
      redirect_back(fallback_location: enroll_path(id: params[:trainee_id]))
    else
      redirect_to placeholder_path
    end
  end

  def cancel
    slot = TimeSlot.find(params[:slot_id])
    if slot.mother.payment == "monthly"
      enrollment = Group.where(trainee_id: @trainee.id, activity_id: slot.mother.id)
    else
      enrollment = Enrollment.where(trainee_id: @trainee.id, time_slot_id: slot.id)
    end
    enrollment.first.destroy
    redirect_back(fallback_location: @trainee )
  end

  def enroll_child
    @trainee = Trainee.find(params[:id])
    @trainee_child = Trainee.new
  end

  def create_child
    child_trainee = Trainee.create(enroll_params)
    @test = Child.create(trainee_id: params[:trainee][:parent_id], child_trainee_id: child_trainee.id)
    redirect_to child_trainee
  end

  def history
    trainee_enrollments = Enrollment.where(trainee_id: @trainee.id).pluck(:time_slot_id)
    @past_time_slots = TimeSlot.find(trainee_enrollments).select {|x| x.start_time.to_date < Date.today}
  end


  private
  def enroll_params
    params.require(:trainee).permit(:email, :first, :last, :phone)
  end

  def set_trainee
    @trainee = Trainee.find(params[:trainee_id])
  end
end
