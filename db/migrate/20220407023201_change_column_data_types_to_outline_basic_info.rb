class ChangeColumnDataTypesToOutlineBasicInfo < ActiveRecord::Migration[6.1]
  def change
    change_column :outline_basic_infos, :article_width, :text
    change_column :outline_basic_infos, :article_depth, :text
    change_column :outline_basic_infos, :article_readability, :text
    change_column :outline_basic_infos, :cv_guidance, :text
    change_column :outline_basic_infos, :cv_name, :text
    change_column :outline_basic_infos, :destination_url, :text
    change_column :outline_basic_infos, :feature_image, :text

  end
end
