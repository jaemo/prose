module Prose
  class Asset < ActiveRecord::Base

    has_many :page_region_assets, dependent: :destroy
    has_many :regions, through: :page_region_assets

    validates :name, presence: true
  end
end
