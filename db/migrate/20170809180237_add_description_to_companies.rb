class AddDescriptionToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :description, :text
  end
end
