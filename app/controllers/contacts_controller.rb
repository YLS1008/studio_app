class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ destroy ]

  # GET /contacts/new
  def new
    @contact = Contact.new
    @activities = Activity.all
  end

  # POST /contacts or /contacts.json
  def create
    
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        ContactMailer.thank_you(@contact).deliver_now
        AdminMailer.new_contact(@contact).deliver_later
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
      format.html { redirect_to all_contacts_path, notice: "Contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:email, :name, :type_of_contact, :details, :mobile, :freq, :interests => [])
    end
end
