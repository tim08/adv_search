class AddVerifiedToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :verified, :boolean, default: false
  end
end
