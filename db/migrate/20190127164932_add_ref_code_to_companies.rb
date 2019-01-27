class AddRefCodeToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :ref_code, :string
  end
end
