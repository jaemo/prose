module Prose
  class Page < ActiveRecord::Base
    belongs_to :template
    has_many :page_region_assets, dependent: :destroy
    has_many :regions, through: :page_region_assets
    has_many :assets, through: :page_region_assets

    validates :title, :menu_title,  presence: true
    acts_as_nested_set

    extend FriendlyId
    friendly_id :title, use: :slugged

    scope :nested_set, -> { order("lft ASC") }
    scope :reversed_nested_set, ->{ order("lft DESC") }

    def should_generate_new_friendly_id?
      slug.blank? || title_changed?
    end

    #cms organization methods
    def editable_region_content_for(region)
      region.asset_content(self)
    end


    def section
      self_and_ancestors.select{|p| p.depth == 1}.first
    end

    def has_content_in?(placeholder)
      page_region_assets.collect{|pra| pra.region.placeholder == placeholder}.any?
    end

    def region_assets_for(region)
      page_region_assets.where(region_id: region.id).collect{|pra| pra.asset}
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
