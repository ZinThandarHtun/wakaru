class CreateOutlineUpBasicInfo < ActiveRecord::Migration[6.1]
  def change
    create_table :outline_up_basic_infos do |t|
      t.references :writing_keyword, null: false, foreign_key: true
      t.string :title, null: false, limit: 255
      t.string :cv_name, null: false, limit: 255
      t.string :destination_url, null: false, limit: 255
      t.string :lead_sentence, limit: 255
      t.integer :del_flg, null: false, limit: 1, default: 0
      t.integer :created_user, null: false
      t.integer :updated_user
      t.timestamps
    end
  end
end
