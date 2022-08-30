module V2
  class ContactSerializer < ActiveModel::Serializer
    attributes :id, :name, :email

    belongs_to :kind do
      link(:related) { contact_kind_url(object.id) }
    end

    has_many :phones do
      link(:related) { contact_phones_url(object.id) }
    end

    has_one :address do
      link(:related) { contact_address_url(object.id) }
    end
  end
end
