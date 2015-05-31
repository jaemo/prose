module Prose
  class Region < ActiveRecord::Base

    include ActiveModel::Serializers::JSON

    has_many :template_regions, dependent: :destroy
    has_many :templates, through: :template_regions

    has_many :page_region_assets, dependent: :destroy
    has_many :assets, through: :page_region_assets
    has_many :pages, through: :page_region_assets

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
