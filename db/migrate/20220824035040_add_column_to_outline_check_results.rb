class AddColumnToOutlineCheckResults < ActiveRecord::Migration[6.1]
  def change
    add_column :outline_check_results, :error_count, :integer, null: false, default: 0
  end
end
