class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :user_name, limit: 255
      t.string :user_name_last, limit: 255
      t.references :user_level, null: false, foreign_key: true
      t.string :notify_email, default: "", null: false
      t.integer :del_flg, null: false, limit: 1, default: 0
      t.integer :create_user, null: false
      t.integer :update_user, null: false
      t.timestamps
    end
  end
end
