class CreateConfigs < ActiveRecord::Migration[6.1]
  def change
    create_table :configs do |t|
      t.string :key, null: false, limit: 255
      t.text :description, null: false
      t.integer :del_flg, null: false, limit: 1, default: 0
      t.integer :created_user, null: false
      t.integer :updated_user
      t.timestamps
    end
  end
end