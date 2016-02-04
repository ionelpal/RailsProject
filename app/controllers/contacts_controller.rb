class ContactsController < ApplicationController


before_filter :authenticate_user!
before_filter :ensure_admin, :only => [:destroy]

  before_action :set_contact, only: [:show, :edit, :update]
def ensure_admin
  unless current_user && current_user.admin?
  render:text => "Access Error", :status => :unauthorized
  end
  end 


  respond_to :html

  def index
    @contacts = Contact.all
    respond_with(@contacts)
  end

  def show
    respond_with(@contact)
  end

  def new
    @contact = Contact.new
    respond_with(@contact)
  end

  def edit
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.save
    respond_with(@contact)
  end

  def update
    @contact.update(contact_params)
    respond_with(@contact)
  end

  def destroy
    @contact.destroy
    respond_with(@contact)
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:firstname, :lastname, :emaill, :phone, :message)
    end
end
