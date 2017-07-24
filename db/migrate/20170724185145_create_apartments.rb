class CreateApartments < ActiveRecord::Migration[5.1]
  def change
    create_table :apartments do |t|
      t.string :street
      t.string :city
      t.string :zipcode
      t.string :state
      t.string :country
      t.string :name
      t.string :phone
      t.string :hours

      t.timestamps
    end
  end
end
