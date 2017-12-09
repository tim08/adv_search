class AddAdditionalFieldsToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :date_foundation, :date
    add_column :companies, :company_site, :string
    add_column :companies, :mobile_phone_contact, :string
  end
end
