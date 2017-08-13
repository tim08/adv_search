class AddAddressContactToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :address_contact, :string
  end
end
