class InstructorsController < ApplicationController



  def home
  end
  
  def show
    @instructor = Instructor.find(params[:id])
    @instructor_time_slots = TimeSlot.joins(:activity => :instructor).where(:instructor => {:id => @instructor.id},
                                :start_time => (Date.today..Date.today + 2.week)).order(start_time: :desc)
  end


  def index
    @all_instructors = Instructor.all
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def instructor_edit_profile
  end

  def update
    byebug
    Instructor.update(update_params)
    redirect_to instructors_path
  end

  def salary
  end
  

  private
  def update_params
    params.require(:instructor).permit(:email, :first, :last, :phone, :description, :speciality, :color, :image)
  end
  
end
