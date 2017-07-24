class Apartment < ApplicationRecord
  #Place the validates here so that fields can't be empty. This is server side?
  validates :street, :city, :zipcode, :state, :country, :name, :phone, :hours, presence: true
  validates :zipcode, length: { is: 5 }
end
