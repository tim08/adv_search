class AddEmailContactToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :email_contact, :string
  end
end
