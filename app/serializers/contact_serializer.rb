class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  belongs_to :kind do 
    link(:related) { (api_v1_contact_kind_url(object.id) unless object.kind.nil?) }
  end

  has_many :phones do 
    link(:related) { (api_v1_contact_phones_url(object.id) unless object.phones.nil?) }
  end
  
  has_one :address

  meta do {
    author: "Caio Lucena"
  }
  end

  def attributes(*args)
    hash_toBr = super(*args)
    # pt-BR ---> hash_toBr[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    hash_toBr[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    hash_toBr
  end
end
