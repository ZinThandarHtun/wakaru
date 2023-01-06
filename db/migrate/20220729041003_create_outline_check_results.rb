class CreateOutlineCheckResults < ActiveRecord::Migration[6.1]
  def change
    create_table :outline_check_results do |t|
      t.references :writing_keyword, null: false, foreign_key: true
      t.string :target_field, null: false, limit: 256
      t.string :target_sub_field, null: false, limit: 256
      t.text :inserted_values, null: false
      t.text :error_messages, null: false
      t.integer :del_flg, null: false, limit: 1, default: 0
      t.integer :created_user, null: false
      t.integer :updated_user
      t.timestamps
    end
  end
end
