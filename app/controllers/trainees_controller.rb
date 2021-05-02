class TraineesController < ApplicationController
  before_action :set_trainee, only: [:show, :edit, :update, :destroy]

  # GET /trainees
  # GET /trainees.json
  def index
    @trainees = Trainee.all
  end


  # GET /trainees/1
  # GET /trainees/1.json
  def show
    @enrolled_activity = @trainee.time_slots
    enrolled_classes = []
    @enrolled_activity.ids.each do |id|
      activity = TimeSlot.find(id).mother
      if activity.payment == "monthly"
        enrolled_classes.push(activity)
      end
    end
    @uniq_enrolled_classes = enrolled_classes.uniq{|x| x.id}
  end

  def load_tickets

    @trainee = Trainee.find(params[:trainee][:id])
    curr_num_tickets = @trainee.ticket
    @trainee.update(ticket: curr_num_tickets + params[:trainee][:ticket].to_i)
    redirect_to @trainee
  end


  def cancel_enroll

    enroll = Enrollment.where(trainee_id: params[:trainee_id], time_slot_id: params[:time_slot_id])

    trainee = Trainee.find(params[:trainee_id])
    enroll.destroy_all
    trainee.refund_ticket
    redirect_to trainee
  end

  # GET /trainees/new
  def new
    @trainee = Trainee.new
  end

  # GET /trainees/1/edit
  def edit
  end

  # POST /trainees
  # POST /trainees.json
  def create
    @trainee = Trainee.new(trainee_params)

    respond_to do |format|
      if @trainee.save
        format.html { redirect_to @trainee, notice: 'Trainee was successfully created.' }
        format.json { render :show, status: :created, location: @trainee }
      else
        format.html { render :new }
        format.json { render json: @trainee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainees/1
  # PATCH/PUT /trainees/1.json
  def update
    respond_to do |format|
      if @trainee.update(trainee_params)
        format.html { redirect_to @trainee, notice: 'Trainee was successfully updated.' }
        format.json { render :show, status: :ok, location: @trainee }
      else
        format.html { render :edit }
        format.json { render json: @trainee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainees/1
  # DELETE /trainees/1.json
  def destroy
    @trainee.destroy
    respond_to do |format|
      format.html { redirect_to trainees_url, notice: 'Trainee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trainee
      @trainee = Trainee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trainee_params
      params.require(:trainee).permit(:email, :first, :last, :phone, :ticket, :id, :birthday)
    end
end
