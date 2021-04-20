class InstructorsController < ApplicationController

  def home
    @instructor = Instructor.find(params[:id])
  end
  
  def show

  end

  def index
    @all_instructors = Instructor.all
  end
    
  
end
