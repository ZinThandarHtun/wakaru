class CreateErrorSolveMessage < ActiveRecord::Migration[6.1]
  def change
    create_table :error_solve_messages do |t|
      t.string :error_solve_msg_name, limit: 255
      t.text :error_solve_msg_description
      t.integer :del_flg, null: false, limit: 1, default: 0
      t.integer :created_user, null: false
      t.integer :updated_user, null: false

      t.timestamps
    end
  end
end
