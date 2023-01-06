class AddH2AdjsColumnToSiteH2Infos < ActiveRecord::Migration[6.1]
  def change
    add_column :site_h2_infos, :h2_adjs, :jsonb
  end
end
