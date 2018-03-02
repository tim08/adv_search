class AddWidgetContactDetailsToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :widget_contact_details, :text
  end
end
