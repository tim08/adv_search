class RenameField < ActiveRecord::Migration[5.1]
  def change
    rename_column :reviews, :type, :type_review
  end
end
