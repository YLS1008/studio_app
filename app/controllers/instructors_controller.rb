class InstructorsController < ApplicationController

  def home
  end
  
  def show
    @instructor = Instructor.find(params[:id])
  end

  def index
    @all_instructors = Instructor.all
  end
    
  
end
