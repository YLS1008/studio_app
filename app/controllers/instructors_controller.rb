class InstructorsController < ApplicationController

  def profile
    if !current_instructor
      @instructor = @new_instructor
    else
      @instructor = current_instructor
    end
    
  end
end
