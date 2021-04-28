class AdminsController < ApplicationController
  def dashboard
    @activities = TimeSlot.all
    @contacts = Contact.all
    @trainees = Trainee.all
    @open_tasks = Task.where(status: "open")
  end

  def all_instructors
    @all_instructors = Instructor.all
  end

  def all_users
    @all_users = User.all
  end

  def finalize
    time_slot = TimeSlot.find(params[:time_slot][:id])
    trainee_id = Trainee.get_id_from_full_name(params[:time_slot][:enrolled])

      if params[:time_slot][:enroll_type] == "הרשמה חודשית"
        all_time_slots = TimeSlot.where(activity_id: time_slot.mother)
        all_time_slots.each do |slot|
          Enrollment.create(trainee_id: trainee_id,
          time_slot_id: slot.id, registration: "monthly")
        end
      else
          Enrollment.create(trainee_id: trainee_id,
        time_slot_id: time_slot.id)
      end

      trainee = Trainee.find(trainee_id)
      if time_slot.mother.payment == "entry"
        trainee.charge_ticket
      end
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

  def conversation
    @task = Task.new
    @trainee = Trainee.find(params[:id])
    @statuses = Task.statuses
    @log = Conversation.new
    @conversation_logs = @trainee.conversations.all
    @task_logs = @trainee.tasks.where(status: 0)
  end

  def log_conversation
    Conversation.create(trainee_id: params[:conversation][:trainee_id], content: params[:conversation][:content])
    @trainee = Trainee.find(params[:conversation][:trainee_id])
    redirect_to conversation_path(@trainee)
  end


  def add_task
    Task.create(trainee_id: params[:task][:trainee_id],
                 content: params[:task][:content],
                 due_date: params[:task][:due_date])
    @trainee = Trainee.find(params[:task][:trainee_id])
    redirect_to conversation_path(@trainee)
  end

  def closed_tasks
    @closed_tasks = Task.where(trainee_id: params[:id], status: 'closed')
  end

  def update_status
    Task.find(params[:task][:id]).update(status: "closed")
    redirect_to conversation_path(id: params[:task][:trainee_id])
  end

  def calendar
    @activities = TimeSlot.all
    @contacts = Contact.all
    @trainees = Trainee.all
  end

  
end
