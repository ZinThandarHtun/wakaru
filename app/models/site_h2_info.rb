class SiteH2Info < ApplicationRecord
    belongs_to :site_infos

    has_many :site_h3_infos
end