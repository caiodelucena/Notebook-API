class Contact < ApplicationRecord
  belongs_to :kind

  def author
    "Caio Lucena"
  end

  def as_json(option = {})
    super(
      except: [:kind_id],
      methods: :author,
      include: { kind: { only: :description } } 
    )
  end
end
