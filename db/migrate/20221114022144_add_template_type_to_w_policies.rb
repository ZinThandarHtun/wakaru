class AddTemplateTypeToWPolicies < ActiveRecord::Migration[6.1]
  def change
    add_column :w_policies, :template_type, :string
  end
end
