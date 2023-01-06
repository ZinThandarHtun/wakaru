class CreateNgWords < ActiveRecord::Migration[6.1]
  def change
    create_table :ng_words do |t|
      t.string :ng_word, null: false
      t.string :ok_word
      t.integer :del_flg, null: false, limit: 1, default: 0
      t.integer :create_user, null: false
      t.integer :update_user, null: false
      t.timestamps
    end
  end
end
