class TimeSlotsController < ApplicationController 
  include DateHelper
  before_action :set_time_slot, only: [:show, :edit, :update, :destroy]
  

  # GET /time_slots
  # GET /time_slots.json
  def index
    @time_slots = TimeSlot.all
  end

  # GET /time_slots/1
  # GET /time_slots/1.json
  def show
  end

  # GET /time_slots/new
  def new
    @time_slot = TimeSlot.new
    @activity = Activity.find(params[:id])
  end

  # GET /time_slots/1/edit
  def edit
  end

  # POST /time_slots
  # POST /time_slots.json
  def create
    @time_slot = TimeSlot.new(time_slot_params)
    if @time_slot.save 
      if time_slot_params[:recurring]
        loop do
          @last_entry = TimeSlot.last
          next_date = copy_recurring_event(@last_entry, @last_entry.start_time)
          break if !next_date
        end  
      end
    end
    redirect_to root_path
  end



  # PATCH/PUT /time_slots/1
  # PATCH/PUT /time_slots/1.json
  def update
    respond_to do |format|
      if @time_slot.update(time_slot_params)
        format.html { redirect_to @time_slot, notice: 'Time slot was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_slot }
      else
        format.html { render :edit }
        format.json { render json: @time_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_slots/1
  # DELETE /time_slots/1.json
  def destroy
    @time_slot.destroy
    respond_to do |format|
      format.html { redirect_to time_slots_url, notice: 'Time slot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_slot
      @time_slot = TimeSlot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def time_slot_params
      params.require(:time_slot).permit(:activity_id, :start_time, :end_time, :enrolled, :recurring)
    end
end
