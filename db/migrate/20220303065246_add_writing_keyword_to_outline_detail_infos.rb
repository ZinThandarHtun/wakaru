class AddWritingKeywordToOutlineDetailInfos < ActiveRecord::Migration[6.1]
  def change
    add_reference :outline_detail_infos, :writing_keyword, foreign_key: true
  end
end
