 class Api::V1::OutlineBasicInfoController < ApplicationController
   def index 
   end
   def personal
      @person=OutlineBasicInfo.where(writing_keyword_id:135,del_flg:0)
      @detail=OutlineDetailInfo.where(writing_keyword_id:135,del_flg:0)
      render json: {person:@person,detail:@detail}
   
   end
   def siteInfo
      @result =SiteInfo.select('id,site_title,site_url,h2_count,h3_count').where('del_flg=? and writing_keyword_id=? and selected=?',0,1,1)
      @resultdata = @result.as_json(:include => { :site_h2_infos => {:include => { :site_h3_infos =>{:only=>[:h3,:header_classification_dict_id,:id]} },:only=>[:h2,:header_classification_dict_id,:id]}})
      @headerClassification=HeaderClassificationDict.all
      render json: {resultdata:@resultdata,headerClassification:@headerClassification}
   end
   def relatedKeywords
      @relatedKeywords=RelatedKeyword.where(del_flg:0,writing_keyword_id:1)
      @h2=SiteH2Info.select('id,h2_nouns').where('del_flg=? and writing_keyword_id=? and selected=?',0,1,1)
      @resulth2=@h2.as_json(:include=>{ :site_h3_infos=>{:only=>[:h3_nouns,:id]}})
      @useSite =SiteInfo.select('id').where('del_flg=? and writing_keyword_id=? and selected=?',0,1,1)
      @userSiteResult = @useSite.as_json(:include => { :site_h2_infos => {:include => { :site_h3_infos =>{:only=>[:h3_nouns,:id]} },:only=>[:h2_nouns,:id]}})
      @totalSite =SiteInfo.where('del_flg=? and writing_keyword_id=? and selected=?',0,1,1).count
      @h2h3h4=OutlineDetailInfo.select('header_title').where(writing_keyword_id:1,del_flg:0)
      render json: {relatedKeywords:@relatedKeywords,resulth2:@resulth2,userSiteResult:@userSiteResult,totalSite:@totalSite,h2h3h4:@h2h3h4}
   end

   def siteH2Condition
      @h2Condition=SiteH2Condition.joins("LEFT JOIN header_classification_dicts
             ON header_classification_dicts.id=site_h2_conditions.header_classification_dict_id").where("site_h2_conditions.del_flg= 0 and site_h2_conditions.writing_keyword_id=1").joins("LEFT JOIN site_infos
             ON site_infos.id=site_h2_conditions.site_info_id").select(
            'site_h2_conditions.competingsite_h2_count AS competingsite_h2_count','site_h2_conditions.ownsite_h2_count AS ownsite_h2_count','site_h2_conditions.header_classification_dict_id AS header_classification_dict_id','site_h2_conditions.site_info_id AS site_info_id', 'header_classification_dicts.header_classification AS header_classification','site_infos.site_no as site_no',).order('site_infos.site_no') 
      @HeaderClassificationDicts=HeaderClassificationDict.where(del_flg:0).select('id AS id','header_classification AS header_classification')
      render json: {h2Condition:@h2Condition,HeaderClassificationDicts:@HeaderClassificationDicts}
   end
   def siteH3Condition
      @h3Condition=SiteH3Condition.joins("LEFT JOIN header_classification_dicts
             ON header_classification_dicts.id=site_h3_conditions.header_classification_dict_id").where("site_h3_conditions.del_flg= 0 and site_h3_conditions.writing_keyword_id=1").joins("LEFT JOIN site_infos
             ON site_infos.id=site_h3_conditions.site_info_id").select(
            'site_h3_conditions.competingsite_h3_count AS competingsite_h3_count','site_h3_conditions.ownsite_h3_count AS ownsite_h3_count','site_h3_conditions.header_classification_dict_id AS header_classification_dict_id','site_h3_conditions.site_info_id AS site_info_id', 'header_classification_dicts.header_classification AS header_classification','site_infos.site_no as site_no',).order('site_infos.site_no') 
      @h3HeaderClassificationDicts=HeaderClassificationDict.where(del_flg:0).select('id AS id','header_classification AS header_classification')
      render json: {h3Condition:@h3Condition,h3HeaderClassificationDicts:@h3HeaderClassificationDicts}
   end
   def excelsample
      @person=OutlineBasicInfo.where(writing_keyword_id:135,del_flg:0)
     respond_to do |format|
      format.html
      format.csv { send_data @person.to_csv }
      format.xls { send_data @person.to_csv(col_sep: "\t") }
    end
   end
end