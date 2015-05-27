require 'rails_helper'

module Prose
  RSpec.describe Asset, type: :model do
    let(:asset){ create(:prose_asset) }
    describe 'validity' do
      it "is invalid without a name" do
        asset.name = nil
        expect(asset).not_to be_valid
      end
    end
  end
end
