class AddSloganToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :slogan, :string
  end
end
