class ChangeColumnNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :outline_up_basic_infos, :title, true
    change_column_null :outline_up_basic_infos, :cv_name1, true
    change_column_null :outline_up_basic_infos, :destination_url1, true
    change_column_null :outline_up_detail_infos, :header_type, true
    change_column_null :outline_up_detail_infos, :header_title, true
    change_column_null :outline_up_detail_infos, :header_detail, true
    change_column_null :outline_up_detail_infos, :word_count, true
    change_column_null :article_up_basic_infos, :title, true
    change_column_null :article_up_basic_infos, :cv_name1, true
    change_column_null :article_up_basic_infos, :destination_url1, true
    change_column_null :article_up_basic_infos, :lead_sentence, true
    change_column_null :article_up_detail_infos, :header_type, true
    change_column_null :article_up_detail_infos, :header_title, true
    change_column_null :article_up_detail_infos, :header_detail, true
    change_column_null :article_up_detail_infos, :word_count, true
    change_column_null :article_review_result_notations, :hit_count, true
    change_column_null :article_review_res_indents, :article_up_basic_info_id, false
    change_column_null :article_review_res_compos, :level_match, false
    change_column_null :article_review_res_compos, :header_match, false
    change_column_null :article_review_res_compos, :word_cnt_range, false
  end
end
