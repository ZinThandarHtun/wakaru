class Api::V1::TemplateTypesController < ApplicationController
#   before_action :set_writing_policy, only: %i[ show edit update destroy ]
  def index
 @templates_types = TemplateType.all
    
  # @writing_policies =SELECT DISTINCT "writing_policies".* FROM "writing_policies" INNER JOIN "template_types" ON "writing_policies"."template_type_id" = "template_types"."id"
   logger.info "TT #{@templates_types.inspect}"
    render json: @templates_types
  end

#   User.joins("LEFT JOIN bookmarks ON bookmarks.bookmarkable_type = 'Post' AND bookmarks.user_id = users.id")

#   def show
#     render json: @writing_policy
#   end
#   def new
#      @writing_policy = WritingPolicy.new

#   end

  

#   def update
#   end

#   def destroy 
#   end
end