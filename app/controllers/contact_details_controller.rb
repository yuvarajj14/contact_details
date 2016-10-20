class ContactDetailsController < ApplicationController
  def index
    @contact_details = ContactDetail.all
    # @primary_address = @contact_details.addresses.where(primary_address: true)
    # @primary_phone_number = @contact_details.phone_numbers.where(primary_number: true)
  end

  def new
    @contact_detail = ContactDetail.new
    @contact_detail.addresses.build
    @contact_detail.phone_numbers.build
  end

  def create
    @contact_detail = ContactDetail.new(contact_detail_params)
    if @contact_detail.save
      redirect_to contact_detail_path(@contact_detail.id)
    else
      render 'new'
    end
  end

  def show
    @contact_detail = ContactDetail.find_by(id: params[:id])
  end

  def edit
    @contact_detail = ContactDetail.find_by(id: params[:id])
  end

  def update
    @contact_detail = ContactDetail.find_by(id: params[:id])
    if @contact_detail.update(contact_detail_params)
      redirect_to contact_detail_path(@contact_detail.id)
    else
      render 'edit'
    end
  end

  def destroy
    @contact_detail = ContactDetail.find_by(id: params[:id])
    @contact_detail.destroy
    redirect_to contact_details_path
  end

  private
  def contact_detail_params
    params.require(:contact_detail).permit(:name, :email, addresses_attributes: [:id, :address_line, :primary_address, :_destroy], phone_numbers_attributes: [:id, :mobile_number, :primary_number, :_destroy])
  end
end
