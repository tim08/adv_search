class AddNewTypeToConpanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :professional_photography, :boolean, default: false
    add_column :companies, :marketing_automation, :boolean, default: false
  end
end
