class InterestsController < ApplicationController
  def new
    @interest = Interest.new(time_slot_id: param[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
  end
end
