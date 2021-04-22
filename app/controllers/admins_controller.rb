class AdminsController < ApplicationController
  def dashboard
    @activities = TimeSlot.all
    @contacts = Contact.all
    @trainees = Trainee.all
  end

  def all_instructors
    @all_instructors = Instructor.all
  end

  def all_users
    @all_users = User.all
  end

  def finalize

    enrollment = Enrollment.create(trainee_id: Trainee.get_id_from_full_name(params[:time_slot][:enrolled]),
                         time_slot_id: params[:time_slot][:id])
    trainee = Trainee.find(enrollment.trainee_id)
    trainee.charge_ticket
    redirect_to admin_root_path
  end


  def enroll
    @time_slot = TimeSlot.find(params[:id])
    @available_trainees = Trainee.all - @time_slot.trainees
    @full_names_arr = []
    @available_trainees.each do |t|
      @full_names_arr.push(t.first + ' ' + t.last)
    end
    
  end


end
