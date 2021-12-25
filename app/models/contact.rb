class Contact < ApplicationRecord
  # Kaminari
  paginates_per(5)

  belongs_to :kind
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true

  # def as_json(option = {})
  #   hash_toBr = super(
  #       except: [:kind_id],
  #       include: [{ kind: { only: :description } }, { phones: { only: :number } }, { address: { only: [:street, :city] } }] 
  #     )
  #   hash_toBr[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
  #   hash_toBr
  # end
end
