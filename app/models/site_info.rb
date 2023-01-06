class SiteInfo < ApplicationRecord
   has_many :site_h2_infos,class_name: "SiteH2Info"
   # belongs_to :site_h2_conditions
end