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
    name_arr = params[:time_slot][:enrolled].split(' ')
    @selected_trainee = Trainee.where(first: name_arr[0], last: name_arr[1])
    @selected_time_slot = TimeSlot.find(params[:time_slot][:id])
    @selected_time_slot.finalize_enroll(@selected_trainee.first.id)
    @selected_trainee.first.finalize_enroll(params[:time_slot][:id])
    redirect_to admin_root_path
  end

  def enroll
    @time_slot = TimeSlot.find(params[:id])
    @all_trainees = Trainee.all
    @trainee_hash = {}
    @all_trainees.each do |trainee|
      if !trainee.is_enrolled?(params[:id])
        t_id = trainee.id
        @trainee_hash[:t_id] = [name: trainee.first + ' ' + trainee.last]
      end
    end
  end


end
