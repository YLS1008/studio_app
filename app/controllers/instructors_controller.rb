class InstructorsController < ApplicationController

  def home
    @instructor = Instructor.find(params[:id])
    @instructor_time_slots = TimeSlot.joins(:activity => :instructor).where(:instructor => {:id => @instructor.id},
                                :start_time => (Date.today..Date.today + 2.week)).order(start_time: :desc)
  end
  
  def show

  end

  def index
    @all_instructors = Instructor.all
  end

  def edit
    @instructor = Instructor.find(params[:resource])
    render :edit
  end

  def update
    Instructor.update(update_params)
    redirect_to instructors_path
  end

  private
  def update_params
    params.require(:instructor).permit(:email, :first, :last, :phone, :description, :speciality, :color, :image)
  end
  
end
