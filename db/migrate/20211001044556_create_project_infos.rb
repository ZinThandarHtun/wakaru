class CreateProjectInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :project_infos do |t|
      t.string :project_name, null: false, limit: 255
      t.integer :min_wordcount, null: false
      t.integer :max_wordcount, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :del_flg, null: false, limit: 1, default: 0
      t.integer :create_user, null: false
      t.integer :update_user
      t.timestamps
    end
  end
end
