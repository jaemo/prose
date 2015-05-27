module Prose
  class Region < ActiveRecord::Base

    include ActiveModel::Serializers::JSON

    has_many :template_regions, class_name: "Prose::TemplateRegion"
    has_many :templates, class_name: "Prose::Template", through: :template_regionsa

    has_many :page_region_assets, class_name: "Prose::PageRegionAsset"
    has_many :assets, class_name: "Prose::Asset", through: :page_region_assets
    has_many :pages, class_name: "Prose::Page", through: :page_region_assets

    validates :name, :placeholder, presence: true
    validates :placeholder, uniqueness: true

    def asset_content(page)
      assets.collect{|a| HashWithIndifferentAccess.new({asset_id: a.id, region_id: id, page_id: page.id, content: a.content})}
    end

    def serialized_assets_for(page)
      Prose::PageRegionAsset.where(page_id: page.id, region_id: self.id).collect{|a| a.asset.serializable_hash(methods: :content)}.flatten
    end

  end
end
