require 'rails_helper'

module Prose
  RSpec.describe Region, type: :model do
    let(:pra){ create(:prose_page_region_asset) }
    let(:region){ pra.region}
    let(:asset){  pra.asset }
    let(:page){ pra.page }

    describe "#asset_content" do
      it "returns an array of content hashes" do

        expect(region.asset_content(page)).to eq([{"asset_id"=>1, "region_id"=>1, "page_id"=>1, "content"=>"MyText"}])
      end
    end
    describe "#serialized_assets_for" do
      it "returns an array of assets with their content hashes deserialized and the raw text extracted" do

        expect(region.serialized_assets_for(page).first["content"]).to include("MyText")

      end
    end

  end
end
