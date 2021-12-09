class Contact < ApplicationRecord
  belongs_to :kind

  def author
    "Caio Lucena"
  end

  def as_json(option = {})
    super(methods: :author)
  end
end
