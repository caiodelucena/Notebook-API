class AddressSerializer < ActiveModel::Serializer
  attributes :id, :street, :city

  belongs_to :contact do 
    link(:related) { (api_v1_contact_address_url(object.contact.id) unless object.contact.nil?) }
  end
end
