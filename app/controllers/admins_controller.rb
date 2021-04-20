class AdminsController < ApplicationController
  def dashboard
    @activities = TimeSlot.all
    @contacts = Contact.all
  end

  def all_instructors
    @all_instructors = Instructor.all
  end

  def all_users
    @all_users = User.all
  end

  def calendar
  end


end
