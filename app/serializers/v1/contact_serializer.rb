module V1
  class ContactSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :birthdate #, :author

    belongs_to :kind

    has_many :phones

    has_one :address

    meta do
      { author: "Jackson Pires" }
    end

    def attributes(*args)
      h = super(*args)
      h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
      h
    end
  end
end
