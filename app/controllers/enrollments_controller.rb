class EnrollmentsController < ApplicationController
  
  def enroll
    @trainee = Trainee.find(params[:id])
    @trainee_enrollment = @trainee.enrollments
    @time_slots = TimeSlot.all
  end

  def finalize
    @enrollment = Enrollment.new(trainee_id: params[:trainee_id], time_slot_id: params[:slot_id])
       
    if @enrollment.save
      if @enrollment.time_slot.mother.payment == "entry"
        @enrollment.trainee.charge_ticket
      end 
      redirect_to enroll_path(id: params[:trainee_id])
    else
      redirect_to placeholder_path
    end
  end

  def cancel
    @enrollment = Enrollment.where(trainee_id: params[:trainee_id], time_slot_id: params[:slot_id])
    if @enrollment.first.time_slot.mother.payment == "entry"
      @enrollment.first.trainee.refund_ticket
    end
    @enrollment.first.destroy
    redirect_to enroll_path(id: params[:trainee_id])

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


  private
  def enroll_params
    params.require(:trainee).permit(:email, :first, :last, :phone)
  end
end
