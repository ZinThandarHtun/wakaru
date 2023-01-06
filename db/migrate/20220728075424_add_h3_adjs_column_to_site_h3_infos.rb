class AddH3AdjsColumnToSiteH3Infos < ActiveRecord::Migration[6.1]
  def change
    add_column :site_h3_infos, :h3_adjs, :jsonb
  end
end
