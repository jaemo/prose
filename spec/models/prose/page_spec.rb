require 'rails_helper'

module Prose
  RSpec.describe Page, type: :model do
    let(:page){ create(:prose_page) }
    describe "validity" do
      it "is invalid without a title" do
        page.title = nil
        expect(page).not_to be_valid
      end

      it "is invalid without a menu_title" do
        page.menu_title = nil
        expect(page).not_to be_valid
      end

    end

    describe "slug regeneration" do
      before do
        page.title = "a new page title"
        page.save!
      end

      it "has updated the slug after the title was changed" do
        expect(page.slug).to eq('a-new-page-title')
      end
    end

    describe "#editable_region_content_for" do
      let(:region){ create(:prose_region) }
      subject{ page.editable_region_content_for(region) }
      it "returns an assets content" do
        expect(subject).to eq(region.asset_content(page))
      end
    end
  end
end
