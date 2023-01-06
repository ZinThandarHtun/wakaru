class CreateOutlineDetailCheckResults < ActiveRecord::Migration[6.1]
  def change
    create_table :outline_detail_check_results do |t|
      t.references :writing_keyword, foreign_key: true
      t.references :outline_basic_info, foreign_key: true
      t.references :outline_detail_info, foreign_key: true
      t.references :ng_word, foreign_key: true
      t.references :project_ng_word, foreign_key: true
      t.integer :wordcount_flg, null: false, limit: 1, default: 0
      t.integer :del_flg, null: false, limit: 1, default: 0
      t.integer :created_user
      t.integer :updated_user
      t.timestamps
    end
  end
end
