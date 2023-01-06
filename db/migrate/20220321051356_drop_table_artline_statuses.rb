class DropTableArtlineStatuses < ActiveRecord::Migration[6.1]
  def change
    drop_table :artline_statuses
  end
end
