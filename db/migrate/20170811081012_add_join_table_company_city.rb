class AddJoinTableCompanyCity < ActiveRecord::Migration[5.1]
  def change
    create_join_table :companies, :cities do |t|
      t.index [:company_id, :city_id]
      t.index [:city_id, :company_id]
    end
  end
end
