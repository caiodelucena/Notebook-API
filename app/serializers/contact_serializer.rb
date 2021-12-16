class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  def attributes(*args)
    hash_toBr = super(*args)
    # pt-BR ---> hash_toBr[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    hash_toBr[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    hash_toBr
  end
end