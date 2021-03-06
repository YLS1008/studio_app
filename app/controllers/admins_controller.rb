class AdminsController < ApplicationController
  def dashboard
    @activities = TimeSlot.all
    @past_unlocked_slots = TimeSlot.where(locked: false,
                                          start_time: ((Date.today.beginning_of_month - 1.month)..Date.today)).order(:start_time)
    @today_slots = TimeSlot.where(start_time: Date.today.beginning_of_day..Date.today.end_of_day)
    if params[:start_date].nil? then @start_date = Date.today.beginning_of_week else @start_date = params[:start_date] end
  end

  def all_instructors
    @all_instructors = Instructor.all
  end

  def all_users
    @all_users = User.all
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
    redirect_back(fallback_location: conversation_path(id: params[:task][:trainee_id]))
  end

  def calendar
    @activities = TimeSlot.all
    @trainees = Trainee.all
  end

  def all_salaries
    if params[:view_month].nil? then @month = Date.today.month else @month = params[:view_month] end
    @activities = Activity.all.order(:instructor_id)
  end

  

  
end
