class CreateTest < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :name
      t.string :part_number
      t.decimal :price

      t.timestamps
    end
  end
end
