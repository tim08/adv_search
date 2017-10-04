class AddCityToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :p_city, :string
  end
end
