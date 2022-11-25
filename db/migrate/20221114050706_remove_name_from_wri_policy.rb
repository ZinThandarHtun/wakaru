class RemoveNameFromWriPolicy < ActiveRecord::Migration[6.1]
  def change
    remove_column :wri_policies, :template_type, :string
  end
end
