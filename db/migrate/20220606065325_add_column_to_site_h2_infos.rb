class AddColumnToSiteH2Infos < ActiveRecord::Migration[6.1]
  def change
    add_column :site_h2_infos, :display_order, :integer
  end
end
