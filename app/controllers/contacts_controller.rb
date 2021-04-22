class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ destroy ]

  def new
    @contact = Contact.new
    @activities = Activity.all
  end


  def create
    
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to after_contact_path }
        format.json {head :ok}
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1 or /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to admin_root_path, notice: "Contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def convert
    @contact = Contact.find(params[:id])
    @trainee = Trainee.new(email: @contact.email, first: @contact.first, last: @contact.last, phone: @contact.phone)
    respond_to do |format|
      if @trainee.save
        @contact.destroy
        format.html { redirect_to admin_root_path }
        format.json {head :ok}
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:email, :first, :last, :type_of_contact, :phone, :interests, :info => [])
    end
end
