class StaticPagesController < ApplicationController
  def home
    @all_instructors = Instructor.all
    @activities = TimeSlot.query_for_activities('homepage')
  end

  def about
  end

  def contact
  end

  def placeholder
  end
  
  def thanks
  end
end
