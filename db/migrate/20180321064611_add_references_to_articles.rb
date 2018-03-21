class AddReferencesToArticles < ActiveRecord::Migration[5.1]
  def change
    add_reference :articles, :company, index: true
    add_reference :articles, :admin, index: true
  end
end
