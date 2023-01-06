# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_12_01_092029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_review_res_compos", force: :cascade do |t|
    t.bigint "writing_keyword_id", null: false
    t.bigint "outline_up_basic_info_id"
    t.bigint "outline_up_detail_info_id"
    t.bigint "article_up_basic_info_id"
    t.bigint "article_up_detail_info_id"
    t.integer "level_match", limit: 2, null: false
    t.integer "header_match", limit: 2, null: false
    t.integer "word_cnt_range", limit: 2, null: false
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_up_basic_info_id"], name: "index_article_review_res_compos_on_article_up_basic_info_id"
    t.index ["article_up_detail_info_id"], name: "index_article_review_res_compos_on_article_up_detail_info_id"
    t.index ["outline_up_basic_info_id"], name: "index_article_review_res_compos_on_outline_up_basic_info_id"
    t.index ["outline_up_detail_info_id"], name: "index_article_review_res_compos_on_outline_up_detail_info_id"
    t.index ["writing_keyword_id"], name: "index_article_review_res_compos_on_writing_keyword_id"
  end

  create_table "article_review_res_indents", force: :cascade do |t|
    t.bigint "writing_keyword_id", null: false
    t.bigint "article_up_detail_info_id"
    t.bigint "article_up_basic_info_id", null: false
    t.string "line_detail", limit: 255, null: false
    t.integer "comma_cnt_35", limit: 2, default: 0, null: false
    t.integer "comma_cnt", limit: 2, null: false
    t.integer "line_word_cnt", limit: 2, null: false
    t.integer "linebreak_cnt", limit: 2, default: 0, null: false
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_up_basic_info_id"], name: "index_article_review_res_indents_on_article_up_basic_info_id"
    t.index ["article_up_detail_info_id"], name: "index_article_review_res_indents_on_article_up_detail_info_id"
    t.index ["writing_keyword_id"], name: "index_article_review_res_indents_on_writing_keyword_id"
  end

  create_table "article_review_result_notations", force: :cascade do |t|
    t.bigint "writing_keyword_id", null: false
    t.bigint "ng_word_id"
    t.bigint "project_ng_word_id"
    t.integer "hit_count"
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ng_word_id"], name: "index_article_review_result_notations_on_ng_word_id"
    t.index ["project_ng_word_id"], name: "index_article_review_result_notations_on_project_ng_word_id"
    t.index ["writing_keyword_id"], name: "index_article_review_result_notations_on_writing_keyword_id"
  end

  create_table "article_review_results", force: :cascade do |t|
    t.bigint "writing_keyword_id", null: false
    t.integer "cv1_result", limit: 2, null: false
    t.integer "title_result", limit: 2, null: false
    t.integer "outline_result", limit: 2, null: false
    t.integer "wordcnt_result", limit: 2, null: false
    t.integer "ng_result", null: false
    t.integer "projectng_result", null: false
    t.integer "line_result", null: false
    t.integer "linebreak_result", limit: 2, null: false
    t.text "cv_cmt"
    t.text "outline_cmt"
    t.text "wordcnt_cmt"
    t.text "ng_cmt"
    t.text "projectng_cmt"
    t.text "line_cmt"
    t.text "linebreak_cmt"
    t.text "overall_cmt"
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "cv2_result", limit: 2
    t.integer "url1_result", limit: 2
    t.integer "url2_result", limit: 2
    t.integer "lead_sen_result", limit: 2
    t.index ["writing_keyword_id"], name: "index_article_review_results_on_writing_keyword_id"
  end

  create_table "article_up_basic_infos", force: :cascade do |t|
    t.bigint "writing_keyword_id", null: false
    t.string "title", limit: 255
    t.string "cv_name1", limit: 255
    t.string "destination_url1", limit: 255
    t.string "lead_sentence", limit: 255
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "cv_name2", limit: 255
    t.string "destination_url2", limit: 255
    t.index ["writing_keyword_id"], name: "index_article_up_basic_infos_on_writing_keyword_id"
  end

  create_table "article_up_detail_infos", force: :cascade do |t|
    t.bigint "article_up_basic_info_id", null: false
    t.string "header_type", limit: 255
    t.string "header_title", limit: 255
    t.text "header_detail"
    t.integer "word_count"
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_up_basic_info_id"], name: "index_article_up_detail_infos_on_article_up_basic_info_id"
  end

  create_table "artline_statuses", force: :cascade do |t|
    t.string "artline_status", limit: 255, null: false
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "configs", force: :cascade do |t|
    t.string "key", limit: 255, null: false
    t.text "description", null: false
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "error_solve_messages", force: :cascade do |t|
    t.string "error_solve_msg_name", limit: 255
    t.text "error_solve_msg_description"
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "exclude_domains", force: :cascade do |t|
    t.text "exclude_domain", null: false
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "group_user_settings", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "user_id", null: false
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_group_user_settings_on_group_id"
    t.index ["user_id"], name: "index_group_user_settings_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "group_name", limit: 255, null: false
    t.string "group_description", limit: 255, null: false
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "header_classification_dicts", force: :cascade do |t|
    t.integer "display_order", null: false
    t.string "header_classification", limit: 255, null: false
    t.string "keyword", limit: 255, null: false
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "header_classification_level_settings", force: :cascade do |t|
    t.string "upperlevel_keyword", limit: 255, null: false
    t.integer "upplevel_header_classification_id", null: false
    t.integer "upper_display_order", null: false
    t.string "lowerlevel_keyword", limit: 255, null: false
    t.integer "lowlevel_header_classification_id", null: false
    t.integer "lower_display_order", null: false
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ng_words", force: :cascade do |t|
    t.string "ng_word", null: false
    t.string "ok_word"
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "outline_basic_infos", force: :cascade do |t|
    t.bigint "writing_keyword_id", null: false
    t.string "user_attribute", limit: 255, null: false
    t.string "search_condition", limit: 255, null: false
    t.text "article_width"
    t.integer "articlewidth_writing_policy_id"
    t.text "article_depth"
    t.integer "articledepth_writing_policy_id"
    t.text "article_readability"
    t.integer "articlereadability_writing_policy_id"
    t.text "cv_guidance"
    t.text "cv_name"
    t.text "destination_url"
    t.text "feature_image"
    t.string "title", limit: 255
    t.text "lead_sentence"
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "detail_edit_flg", limit: 2
    t.integer "lead_sentence_count"
    t.integer "lead_sentence_del_flg", limit: 2, default: 0, null: false
    t.index ["writing_keyword_id"], name: "index_outline_basic_infos_on_writing_keyword_id"
  end

  create_table "outline_check_results", force: :cascade do |t|
    t.bigint "writing_keyword_id", null: false
    t.string "target_field", limit: 256, null: false
    t.string "target_sub_field", limit: 256, null: false
    t.text "inserted_values", null: false
    t.text "error_messages", null: false
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "outline_detail_info_id"
    t.integer "error_count", default: 0, null: false
    t.string "remove_error_message"
    t.index ["writing_keyword_id"], name: "index_outline_check_results_on_writing_keyword_id"
  end

  create_table "outline_detail_check_results", force: :cascade do |t|
    t.bigint "writing_keyword_id"
    t.bigint "outline_basic_info_id"
    t.bigint "outline_detail_info_id"
    t.bigint "ng_word_id"
    t.bigint "project_ng_word_id"
    t.integer "wordcount_flg", limit: 2, default: 0, null: false
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user"
    t.integer "updated_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ng_word_id"], name: "index_outline_detail_check_results_on_ng_word_id"
    t.index ["outline_basic_info_id"], name: "index_outline_detail_check_results_on_outline_basic_info_id"
    t.index ["outline_detail_info_id"], name: "index_outline_detail_check_results_on_outline_detail_info_id"
    t.index ["project_ng_word_id"], name: "index_outline_detail_check_results_on_project_ng_word_id"
    t.index ["writing_keyword_id"], name: "index_outline_detail_check_results_on_writing_keyword_id"
  end

  create_table "outline_detail_infos", force: :cascade do |t|
    t.bigint "outline_basic_info_id"
    t.bigint "header_classification_dict_id", null: false
    t.bigint "writing_policy_id"
    t.bigint "site_info_id", null: false
    t.string "header_type", limit: 255, null: false
    t.text "header_title"
    t.text "header_detail"
    t.text "ref_url"
    t.integer "word_count"
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "site_h2_info_id"
    t.bigint "site_h3_info_id"
    t.integer "display_order"
    t.bigint "writing_keyword_id"
    t.index ["header_classification_dict_id"], name: "index_outline_detail_infos_on_header_classification_dict_id"
    t.index ["outline_basic_info_id"], name: "index_outline_detail_infos_on_outline_basic_info_id"
    t.index ["site_h2_info_id"], name: "index_outline_detail_infos_on_site_h2_info_id"
    t.index ["site_h3_info_id"], name: "index_outline_detail_infos_on_site_h3_info_id"
    t.index ["site_info_id"], name: "index_outline_detail_infos_on_site_info_id"
    t.index ["writing_keyword_id"], name: "index_outline_detail_infos_on_writing_keyword_id"
    t.index ["writing_policy_id"], name: "index_outline_detail_infos_on_writing_policy_id"
  end

  create_table "outline_statuses", force: :cascade do |t|
    t.string "outline_status", limit: 255, null: false
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "batchuse_flg", limit: 2, null: false
    t.integer "created_user", null: false
    t.integer "updated_user", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "outline_up_basic_infos", force: :cascade do |t|
    t.bigint "writing_keyword_id", null: false
    t.string "title", limit: 255
    t.string "cv_name1", limit: 255
    t.string "destination_url1", limit: 255
    t.string "lead_sentence", limit: 255
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "cv_name2", limit: 255
    t.string "destination_url2", limit: 255
    t.index ["writing_keyword_id"], name: "index_outline_up_basic_infos_on_writing_keyword_id"
  end

  create_table "outline_up_detail_infos", force: :cascade do |t|
    t.bigint "outline_up_basic_info_id", null: false
    t.string "header_type", limit: 255
    t.string "header_title", limit: 255
    t.text "header_detail"
    t.integer "word_count"
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["outline_up_basic_info_id"], name: "index_outline_up_detail_infos_on_outline_up_basic_info_id"
  end

  create_table "project_infos", force: :cascade do |t|
    t.string "project_name", limit: 255, null: false
    t.integer "min_wordcount", null: false
    t.integer "max_wordcount", null: false
    t.bigint "user_id", null: false
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_project_infos_on_user_id"
  end

  create_table "project_ng_words", force: :cascade do |t|
    t.bigint "project_info_id", null: false
    t.string "ng_word", null: false
    t.string "ok_word"
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_info_id"], name: "index_project_ng_words_on_project_info_id"
  end

  create_table "related_keywords", force: :cascade do |t|
    t.bigint "writing_keyword_id", null: false
    t.string "keyword", limit: 255
    t.string "search_volume", limit: 255
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["writing_keyword_id"], name: "index_related_keywords_on_writing_keyword_id"
  end

  create_table "site_h2_conditions", force: :cascade do |t|
    t.bigint "writing_keyword_id", null: false
    t.bigint "site_info_id", null: false
    t.bigint "header_classification_dict_id", null: false
    t.integer "competingsite_h2_count", null: false
    t.integer "ownsite_h2_count", null: false
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["header_classification_dict_id"], name: "index_site_h2_conditions_on_header_classification_dict_id"
    t.index ["site_info_id"], name: "index_site_h2_conditions_on_site_info_id"
    t.index ["writing_keyword_id"], name: "index_site_h2_conditions_on_writing_keyword_id"
  end

  create_table "site_h2_infos", force: :cascade do |t|
    t.bigint "site_info_id", null: false
    t.bigint "writing_keyword_id", null: false
    t.bigint "header_classification_dict_id"
    t.jsonb "h2"
    t.jsonb "h2_nouns"
    t.integer "selected", limit: 2, default: 1
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "display_order"
    t.jsonb "h2_adjs"
    t.index ["header_classification_dict_id"], name: "index_site_h2_infos_on_header_classification_dict_id"
    t.index ["site_info_id"], name: "index_site_h2_infos_on_site_info_id"
    t.index ["writing_keyword_id"], name: "index_site_h2_infos_on_writing_keyword_id"
  end

  create_table "site_h3_conditions", force: :cascade do |t|
    t.bigint "writing_keyword_id", null: false
    t.bigint "site_info_id", null: false
    t.bigint "header_classification_dict_id", null: false
    t.integer "competingsite_h3_count", null: false
    t.integer "ownsite_h3_count", null: false
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["header_classification_dict_id"], name: "index_site_h3_conditions_on_header_classification_dict_id"
    t.index ["site_info_id"], name: "index_site_h3_conditions_on_site_info_id"
    t.index ["writing_keyword_id"], name: "index_site_h3_conditions_on_writing_keyword_id"
  end

  create_table "site_h3_infos", force: :cascade do |t|
    t.bigint "site_info_id", null: false
    t.bigint "writing_keyword_id", null: false
    t.bigint "header_classification_dict_id"
    t.bigint "site_h2_info_id", null: false
    t.jsonb "h3"
    t.jsonb "h3_nouns"
    t.integer "selected", limit: 2, default: 1
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "display_order"
    t.jsonb "h3_adjs"
    t.index ["header_classification_dict_id"], name: "index_site_h3_infos_on_header_classification_dict_id"
    t.index ["site_h2_info_id"], name: "index_site_h3_infos_on_site_h2_info_id"
    t.index ["site_info_id"], name: "index_site_h3_infos_on_site_info_id"
    t.index ["writing_keyword_id"], name: "index_site_h3_infos_on_writing_keyword_id"
  end

  create_table "site_infos", force: :cascade do |t|
    t.bigint "writing_keyword_id", null: false
    t.integer "site_no", null: false
    t.text "site_title", null: false
    t.text "site_url", null: false
    t.integer "selected", limit: 2, default: 0
    t.integer "h2_count"
    t.integer "h3_count"
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["writing_keyword_id"], name: "index_site_infos_on_writing_keyword_id"
  end

  create_table "template_types", force: :cascade do |t|
    t.string "template_type", limit: 255, null: false
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_levels", force: :cascade do |t|
    t.string "user_level", limit: 255, null: false
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name", limit: 255
    t.string "user_name_last", limit: 255
    t.bigint "user_level_id", null: false
    t.string "notify_email", default: "", null: false
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_level_id"], name: "index_users_on_user_level_id"
  end

  create_table "writing_keyword_review_comments", force: :cascade do |t|
    t.bigint "writing_keyword_id", null: false
    t.bigint "outline_status_id", null: false
    t.string "review_comment", limit: 255
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["outline_status_id"], name: "index_writing_keyword_review_comments_on_outline_status_id"
    t.index ["writing_keyword_id"], name: "index_writing_keyword_review_comments_on_writing_keyword_id"
  end

  create_table "writing_keywords", force: :cascade do |t|
    t.string "writing_keyword", limit: 255, null: false
    t.datetime "search_date", null: false
    t.bigint "user_id", null: false
    t.bigint "project_info_id"
    t.bigint "outline_status_id", null: false
    t.text "client_memo"
    t.integer "check_status", limit: 2, default: 0
    t.integer "excel_status", limit: 2, default: 0
    t.integer "menu_id", default: 0
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.boolean "batch_flg", default: false
    t.boolean "h2h3batch_flg", default: false
    t.integer "created_user", null: false
    t.integer "updated_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "file_name"
    t.bigint "artline_status_id", default: 1
    t.integer "h2h3_inserted_flag", limit: 2, default: 0
    t.text "related_keyword_message"
    t.jsonb "dummy_message"
    t.index ["artline_status_id"], name: "index_writing_keywords_on_artline_status_id"
    t.index ["outline_status_id"], name: "index_writing_keywords_on_outline_status_id"
    t.index ["project_info_id"], name: "index_writing_keywords_on_project_info_id"
    t.index ["user_id"], name: "index_writing_keywords_on_user_id"
  end

  create_table "writing_policies", force: :cascade do |t|
    t.bigint "template_type_id", null: false
    t.integer "display_order", null: false
    t.string "template_name", limit: 255, null: false
    t.string "template_description", limit: 255, null: false
    t.integer "del_flg", limit: 2, default: 0, null: false
    t.integer "created_user", null: false
    t.integer "updated_user", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["template_type_id"], name: "index_writing_policies_on_template_type_id"
  end

  add_foreign_key "article_review_res_compos", "article_up_basic_infos"
  add_foreign_key "article_review_res_compos", "article_up_detail_infos"
  add_foreign_key "article_review_res_compos", "outline_up_basic_infos"
  add_foreign_key "article_review_res_compos", "outline_up_detail_infos"
  add_foreign_key "article_review_res_compos", "writing_keywords"
  add_foreign_key "article_review_res_indents", "article_up_basic_infos"
  add_foreign_key "article_review_res_indents", "article_up_detail_infos"
  add_foreign_key "article_review_res_indents", "writing_keywords"
  add_foreign_key "article_review_result_notations", "ng_words"
  add_foreign_key "article_review_result_notations", "project_ng_words"
  add_foreign_key "article_review_result_notations", "writing_keywords"
  add_foreign_key "article_review_results", "writing_keywords"
  add_foreign_key "article_up_basic_infos", "writing_keywords"
  add_foreign_key "article_up_detail_infos", "article_up_basic_infos"
  add_foreign_key "group_user_settings", "groups"
  add_foreign_key "group_user_settings", "users"
  add_foreign_key "outline_basic_infos", "writing_keywords"
  add_foreign_key "outline_check_results", "writing_keywords"
  add_foreign_key "outline_detail_check_results", "ng_words"
  add_foreign_key "outline_detail_check_results", "outline_basic_infos"
  add_foreign_key "outline_detail_check_results", "outline_detail_infos"
  add_foreign_key "outline_detail_check_results", "project_ng_words"
  add_foreign_key "outline_detail_check_results", "writing_keywords"
  add_foreign_key "outline_detail_infos", "header_classification_dicts"
  add_foreign_key "outline_detail_infos", "outline_basic_infos"
  add_foreign_key "outline_detail_infos", "site_h2_infos"
  add_foreign_key "outline_detail_infos", "site_h3_infos"
  add_foreign_key "outline_detail_infos", "site_infos"
  add_foreign_key "outline_detail_infos", "writing_keywords"
  add_foreign_key "outline_detail_infos", "writing_policies"
  add_foreign_key "outline_up_basic_infos", "writing_keywords"
  add_foreign_key "outline_up_detail_infos", "outline_up_basic_infos"
  add_foreign_key "project_infos", "users"
  add_foreign_key "project_ng_words", "project_infos"
  add_foreign_key "related_keywords", "writing_keywords"
  add_foreign_key "site_h2_conditions", "header_classification_dicts"
  add_foreign_key "site_h2_conditions", "site_infos"
  add_foreign_key "site_h2_conditions", "writing_keywords"
  add_foreign_key "site_h2_infos", "header_classification_dicts"
  add_foreign_key "site_h2_infos", "site_infos"
  add_foreign_key "site_h2_infos", "writing_keywords"
  add_foreign_key "site_h3_conditions", "header_classification_dicts"
  add_foreign_key "site_h3_conditions", "site_infos"
  add_foreign_key "site_h3_conditions", "writing_keywords"
  add_foreign_key "site_h3_infos", "header_classification_dicts"
  add_foreign_key "site_h3_infos", "site_h2_infos"
  add_foreign_key "site_h3_infos", "site_infos"
  add_foreign_key "site_h3_infos", "writing_keywords"
  add_foreign_key "site_infos", "writing_keywords"
  add_foreign_key "users", "user_levels"
  add_foreign_key "writing_keyword_review_comments", "outline_statuses"
  add_foreign_key "writing_keyword_review_comments", "writing_keywords"
  add_foreign_key "writing_keywords", "artline_statuses"
  add_foreign_key "writing_keywords", "outline_statuses"
  add_foreign_key "writing_keywords", "project_infos"
  add_foreign_key "writing_keywords", "users"
  add_foreign_key "writing_policies", "template_types"
end
