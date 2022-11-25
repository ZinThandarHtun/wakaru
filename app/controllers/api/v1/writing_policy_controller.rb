class Api::V1::WritingPolicyController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  # 一覧に執筆方針テンプレートテーブルのデータ取得する
  def firstLoad
    begin
      @writing_policies = WriPolicy.joins("LEFT JOIN tem_types
             ON tem_types.id=wri_policies.template_type_id").where(" wri_policies.del_flg= 0 ").select(
            'wri_policies.*', 'tem_types.template_type AS template_type').order(:template_type_id,:display_order)
      @templates_types = TemType.all 
      render json: {writing_policies: @writing_policies,
                    template_types: @templates_types }
    rescue => e
      render json: {
      error: "DB Error",message:"データ取得に失敗しました。",errStatus:"1",messageType:"error"
    }, status: :ok  
    end
  end

  # 執筆方針テンプレートテーブルに登録する
  def create
    begin
     @wp = WriPolicy.new(writing_policy_params) 
     @wp.del_flg = 0
     @wp.created_user = 1
     @wp.updated_user = 1
     @wp.created_at = Time.now
     @wp.updated_at = Time.now
     @wp.save
     render json: @wp
    rescue => e
      render json: {
      error: "DB Error",message:"データ登録に失敗しました。",errStatus:"1",messageType:"error"
    }, status: :ok  
      
    end
  end

 # 執筆方針テンプレートテーブルに更新する
  def update
    begin
     @updateWritingPolicy = WriPolicy.find(params[:id])
     if @updateWritingPolicy.del_flg == 0
     @updateWritingPolicy.updated_user = 2
     @updateWritingPolicy.update(writing_policy_params)
     render json: @updateWritingPolicy
    rescue => e
      render json: {
        error: "DB Error",message:"データ更新に失敗しました。",errStatus:"1",messageType:"error"
      }, status: :ok   
     
    end 
  end

  # 執筆方針テンプレートテーブルに削除する
  def destroy
    begin
      @destroyWritingPolicy = WriPolicy.find(params[:id])
      @destroyWritingPolicy.update(del_flg: 1,updated_user: 3) 
      render json: @destroyWritingPolicy
    rescue => e
      render json: {
        error: "DB Error",message:"データ削除に失敗しました",errStatus:"1",messageType:"error"
      }, status: :ok   
     
    end 
  end

  # 執筆方針データ取得処理
  def writing_policy_params
    params.require(:writing_policy).permit(:id, :display_order, :template_name, :template_description, :template_type_id)
  end

end