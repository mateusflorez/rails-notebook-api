class Contact < ApplicationRecord
  belongs_to :kind

  def kind_description
    self.kind.description
  end

  def as_json(options={})
    super(methods: [:kind_description],
          only: [:name, :email, :birthdate])
  end
end
