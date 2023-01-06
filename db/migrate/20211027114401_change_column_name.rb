class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :exclude_domains, :create_user, :created_user
    rename_column :exclude_domains, :update_user, :updated_user

    rename_column :group_user_settings, :create_user, :created_user
    rename_column :group_user_settings, :update_user, :updated_user

    rename_column :groups, :create_user, :created_user
    rename_column :groups, :update_user, :updated_user

    rename_column :header_classification_dicts, :create_user, :created_user
    rename_column :header_classification_dicts, :update_user, :updated_user

    rename_column :ng_words, :create_user, :created_user
    rename_column :ng_words, :update_user, :updated_user

    rename_column :outline_statuses, :create_user, :created_user
    rename_column :outline_statuses, :update_user, :updated_user

    rename_column :project_infos, :create_user, :created_user
    rename_column :project_infos, :update_user, :updated_user

    rename_column :project_ng_words, :create_user, :created_user
    rename_column :project_ng_words, :update_user, :updated_user

    rename_column :related_keywords, :create_user, :created_user
    rename_column :related_keywords, :update_user, :updated_user

    rename_column :site_h2_infos, :create_user, :created_user
    rename_column :site_h2_infos, :update_user, :updated_user

    rename_column :site_h3_infos, :create_user, :created_user
    rename_column :site_h3_infos, :update_user, :updated_user

    rename_column :site_infos, :create_user, :created_user
    rename_column :site_infos, :update_user, :updated_user

    rename_column :template_types, :create_user, :created_user
    rename_column :template_types, :update_user, :updated_user

    rename_column :user_levels, :create_user, :created_user
    rename_column :user_levels, :update_user, :updated_user

    rename_column :users, :create_user, :created_user
    rename_column :users, :update_user, :updated_user

    rename_column :writing_keywords, :create_user, :created_user
    rename_column :writing_keywords, :update_user, :updated_user

    rename_column :writing_policies, :create_user, :created_user
    rename_column :writing_policies, :update_user, :updated_user
  end
end
