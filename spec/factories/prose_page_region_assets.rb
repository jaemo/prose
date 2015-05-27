FactoryGirl.define do
  factory :prose_page_region_asset, :class => 'Prose::PageRegionAsset' do
    association :page, factory: :prose_page
    association :region, factory: :prose_region
    association :asset, factory: :prose_asset
    position 1
  end

end
