class CreateCustomDescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :custom_descriptions do |t|
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
