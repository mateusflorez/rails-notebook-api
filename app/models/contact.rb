class Contact < ApplicationRecord

  def as_json(options={})
    super(only: [:name, :email, :birthdate, :kind_id])
  end
end
