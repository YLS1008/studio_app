class EnrollmentsController < ApplicationController
  def enroll
    @trainee = Trainee.find(params[:id])
    @trainee_enrollment = @trainee.enrollments
    @time_slots = TimeSlot.all
  end

  def finalize
    @enrollment = Enrollment.new(trainee_id: params[:trainee_id], time_slot_id: params[:slot_id])
    
    if @enrollment.save
      redirect_to enroll_path(id: params[:trainee_id])
    else
      redirect_to placeholder_path
    end
  end

  def cancel
  end

  def get_by_trainee
  end

  def get_by_slot
  end
end
