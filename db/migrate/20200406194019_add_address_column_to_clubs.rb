class AddAddressColumnToClubs < ActiveRecord::Migration[6.0]
  def change
    add_column :clubs, :address_line_one, :string
    add_column :clubs, :address_line_two, :string
    add_column :clubs, :city, :string
    add_column :clubs, :state, :string
    add_column :clubs, :zipcode, :string
  end
end
