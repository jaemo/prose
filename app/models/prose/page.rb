module Prose
  class Page < ActiveRecord::Base
    belongs_to :template, class_name: "Prose::Template"
    has_many :page_region_assets, class_name: "Prose::PageRegionAsset"
    has_many :regions, class_name: "Prose::Region", through: :page_region_assets
    has_many :assets, class_name: "Prose::Asset", through: :page_region_assets

    validates :title, :menu_title,  presence: true
    acts_as_nested_set

    extend FriendlyId
    friendly_id :title, use: :slugged

    scope :nested_set, -> { order("lft ASC") }
    scope :reversed_nested_set, ->{ order("lft DESC") }

    def should_generate_new_friendly_id?
      slug.blank? || title.changed?
    end

    #cms organization methods
    def editable_region_content_for(region)
      region.asset_content(self)
    end

    def region_content_for(region)
      region.raw_content(self)
    end

    def section
      self_and_ancestors.select{|p| p.depth == 1}.first
    end

    def has_content_in?(placeholder)
      r = Prose::Region.find_by_placeholder(placeholder)
      PageRegionCmsAsset.where(:page_id => id, :region_id => r.id).size > 0
    end

    def region_assets_for(region)
      PageRegionCmsAsset.where(:page_id => id, :region_id => region.id)
    end

    def title_with_depth
      spacer = ""
      depth.to_i.times do
        spacer += "-"
      end
      spacer + ">" + title.truncate(50)
    end

    def full_cms_path
      path = ""
      self_and_ancestors.each do |page|
        path += "::"+page.menu_title
      end
      path
    end

  end
end
