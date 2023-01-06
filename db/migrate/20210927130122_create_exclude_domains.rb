class CreateExcludeDomains < ActiveRecord::Migration[6.1]
  def change
    create_table :exclude_domains do |t|
      t.text :exclude_domain, null: false
      t.integer :del_flg, null: false, limit: 1, default: 0
      t.integer :create_user, null: false
      t.integer :update_user, null: false
      t.timestamps
    end
  end
end
