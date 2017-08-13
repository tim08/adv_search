class AddPhoneContactToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :phone_contact, :string
  end
end
