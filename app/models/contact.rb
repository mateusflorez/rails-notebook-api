class Contact < ApplicationRecord

  validates_presence_of :kind
  validates_presence_of :address

  paginates_per 10

  #Associations
  belongs_to :kind
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true
end
