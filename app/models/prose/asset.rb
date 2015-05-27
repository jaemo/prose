module Prose
  class Asset < ActiveRecord::Base

    has_many :page_region_assets, class_name: "Prose::PageRegionAsset"
    has_many :regions, through: :page_region_assets, class_name: "Prose::Region"

    validates :name, presence: true
  end
end
