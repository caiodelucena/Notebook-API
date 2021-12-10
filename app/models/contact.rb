class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones

  accepts_nested_attributes_for :phones, allow_destroy: true

  def author
    "Caio Lucena"
  end

  def as_json(option = {})
    hash_toBr = super(
        except: [:kind_id],
        methods: :author,
        include: [{ kind: { only: :description } }, { phones: { only: :number } }] 
      )
    hash_toBr[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
    hash_toBr
  end
end
