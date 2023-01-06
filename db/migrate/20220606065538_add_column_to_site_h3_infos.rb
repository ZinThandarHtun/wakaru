class AddColumnToSiteH3Infos < ActiveRecord::Migration[6.1]
  def change
    add_column :site_h3_infos, :display_order, :integer
  end
end
