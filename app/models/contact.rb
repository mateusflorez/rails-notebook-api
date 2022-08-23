class Contact < ApplicationRecord
  #Associations
  belongs_to :kind, optional: true
  has_many :phones
end
