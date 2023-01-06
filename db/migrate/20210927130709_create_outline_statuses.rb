class CreateOutlineStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :outline_statuses do |t|
      t.string :outline_status, null: false, limit: 255
      t.integer :del_flg, null: false, limit: 1, default: 0
      t.integer :batchuse_flg, null: false, limit: 1
      t.integer :create_user, null: false
      t.integer :update_user, null: false
      t.timestamps
    end
  end
end
