class Apartment < ApplicationRecord
  belongs_to :user
  #Place the validates here so that fields can't be empty. This is server side?
  validates :street, :city, :zipcode, :state, :country, :name, :phone, :hours, :user, presence: true
  validates :zipcode, length: { is: 5 }
  validates :state, length: { is: 2 }

  resourcify
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment :image, presence: true,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
    size: { in: 0..10.megabytes }
  #These two lines broke our program. The geocoding may need more code here or somewhere else

  # def full_address
  #   full_address ||= street + ',' + city + ',' + state
  # end
  #
  # geocoded_by :full_address
  # after_validation :geocode
  #Geocode method
end
