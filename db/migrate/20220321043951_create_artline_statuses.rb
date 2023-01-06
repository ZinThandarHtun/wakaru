class CreateArtlineStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :artline_statuses do |t|
      t.string :artline_status, null: false, limit: 255
      t.integer :del_flg, null: false, limit: 1, default: 0
      t.integer :create_user, null: false
      t.integer :update_user
      t.timestamps
    end
  end
end
