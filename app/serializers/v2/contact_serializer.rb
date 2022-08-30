module V2
  class ContactSerializer < ActiveModel::Serializer
    attributes :id, :name, :email

    belongs_to :kind

    has_many :phones

    has_one :address
  end
end
