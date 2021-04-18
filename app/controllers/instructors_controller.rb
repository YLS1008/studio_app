class InstructorsController < ApplicationController

  def show
    @instructor = Instructor.find(params[:id])
  end

  def index
    @all_instructors = Instructor.all
  end
    
  
end
