module Api
  module V1
    class ContactsController < ApplicationController
      include ErrorSerializer

      before_action :set_contact, only: [:show, :update, :destroy]
    
      # GET /contacts
      def index
        @contacts = Contact.all.page(params[:page])
    
        paginate json: @contacts
      end
    
      # GET /contacts/1
      def show
        render json: @contact, include: [:kind]
      end
    
      # POST /contacts
      def create
        @contact = Contact.new(contact_params)
    
        if @contact.save
          render json: @contact, status: :created 
        else
          render json: ErrorSerializer.serialize(@contact.errors), status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /contacts/1
      def update
        if @contact.update(contact_params)
          render json: @contact
        else
          render json: @contact.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /contacts/1
      def destroy
        @contact.destroy
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_contact
          @contact = Contact.find(params[:id])
        end
    
        # Only allow a list of trusted parameters through.
        def contact_params
          # params.require(:contact).permit(
          #   :name, :email, :birthdate, :kind_id,
          #   phones_attributes: [:id, :number, :_destroy], 
          #   address_attibutes: [:street, :city, :contact_id]
          # )
          ActiveModelSerializers::Deserialization.jsonapi_parse(params)
        end
    end    
  end
end