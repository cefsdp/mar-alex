class AddCountryRefToGuests < ActiveRecord::Migration[6.0]
  def change
    add_reference :guests, :country, null: false, foreign_key: true
  end
end
