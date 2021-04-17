class StaticPagesController < ApplicationController
  def home
    @all_instructors = Instructor.all
  end

  def about
  end

  def contact
  end

  def placeholder
  end
end
