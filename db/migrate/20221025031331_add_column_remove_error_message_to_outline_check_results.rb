class AddColumnRemoveErrorMessageToOutlineCheckResults < ActiveRecord::Migration[6.1]
  def change
    add_column :outline_check_results, :remove_error_message, :string
  end
end
