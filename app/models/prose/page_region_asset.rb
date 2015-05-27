module Prose
  class PageRegionAsset < ActiveRecord::Base
    belongs_to :page, class_name: "Prose::Page"
    belongs_to :region, class_name: "Prose::Region"
    belongs_to :asset, class_name: "Prose::Asset"

    validates :page, :region, :asset, presence: true
  end
end
