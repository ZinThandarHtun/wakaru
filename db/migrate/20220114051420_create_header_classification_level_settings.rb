class CreateHeaderClassificationLevelSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :header_classification_level_settings do |t|
      t.string :upperlevel_keyword, null: false, limit: 255
      t.integer :upplevel_header_classification_id, null: false
      t.integer :upper_display_order, null: false
      t.string :lowerlevel_keyword, null: false, limit: 255
      t.integer :lowlevel_header_classification_id, null: false
      t.integer :lower_display_order, null: false
      t.integer :del_flg, null: false, limit: 1, default: 0
      t.integer :created_user, null: false
      t.integer :updated_user, null: false
      t.timestamps
    end
  end
end
