class Apartment < ApplicationRecord
  #Place the validates here so that fields can't be empty. This is server side?
  validates :street, :city, :zipcode, :state, :country, :name, :phone, :hours, presence: true
  validates :zipcode, length: { is: 5 }
  validates :state, length: { is: 2 }

  #These two lines broke our program. The geocoding may need more code here or somewhere else
  # geocoded_by :address
  # after_validation :geocode
  # #Geocode method
  # def full_address
  #
  # end
end
