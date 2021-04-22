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
    
  
end
