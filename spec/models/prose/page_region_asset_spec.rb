require 'rails_helper'

module Prose
  RSpec.describe PageRegionAsset, type: :model do
    let(:pra){ create(:prose_page_region_asset) }
    describe "validity" do
      it "is invalid without a page" do
        pra.page = nil
        expect(pra).to_not be_valid
      end
      it "is invalid without a region" do
        pra.region = nil
        expect(pra).to_not be_valid
      end
      it "is invalid without a asset" do
        pra.asset = nil
        expect(pra).to_not be_valid
      end
    end
  end
end
