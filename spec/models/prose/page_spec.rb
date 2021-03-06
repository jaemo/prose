require 'rails_helper'

module Prose
  RSpec.describe Page, type: :model do
    let(:page){ create(:prose_page) }
    let(:region){ create(:prose_region) }
    let(:asset){ create(:prose_asset) }

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
      subject{ page.editable_region_content_for(region) }

      it "returns an assets content" do
        expect(subject).to eq(region.asset_content(page))
      end
    end

    describe "#section" do
      context "page depth is 1"
        let(:child_page){ create(:prose_page, :child_page) }

        before do
          child_page.move_to_child_of(page)
        end

        subject{ child_page.section }

        it "returns itself" do
          expect(subject).to eq(child_page)
        end
      end

      context "page depth is > 1" do
        let(:child_page){ create(:prose_page, :child_page) }
        let(:even_childer_page){ create(:prose_page, :child_page) }

        before do
          child_page.move_to_child_of(page)
          even_childer_page.move_to_child_of(child_page)
        end

        subject{ even_childer_page.section }

        it "returns the parent" do
          expect(subject).to eq(child_page)
        end
      end

      context "page depth is > 2" do
        let(:child_page){ create(:prose_page, :child_page) }
        let(:even_childer_page){ create(:prose_page, :child_page) }
        let(:even_childerer_page){ create(:prose_page, :child_page) }

        before do
          child_page.move_to_child_of(page)
          even_childer_page.move_to_child_of(child_page)
          even_childerer_page.move_to_child_of(even_childer_page)
        end

        subject{ even_childer_page.section }

        it "returns the parent" do
          expect(subject).to eq(child_page)
        end
      end

      describe "#has_content_in?(placeholder)" do
        let!(:page_region_asset){ create(:prose_page_region_asset, region: region, page: page) }
        let(:unused_region){ create(:prose_region, :another_region) }

        context "when the page has content in a region" do
          subject{ page.has_content_in?(region.placeholder) }

          it "returns true" do
            expect(subject).to eq(true)
          end
        end

        context "when the page does not have content in that region" do
          subject {page.has_content_in?(unused_region.placeholder)}
          it "returns false if a page has not content in that region" do
            expect(subject).to eq(false)
          end
        end

      end

      describe "#region_assets_for(region)" do
        let!(:pra){ create(:prose_page_region_asset, page: page, region: region, asset: asset) }

        subject{ page.region_assets_for(region) }

        it "returns the assets for this region" do
          expect(subject).to eq([asset])
        end
      end

      describe "#page.title_with_depth" do
        subject{ page.title_with_depth }
        it "returns the title prefixed by > and a number of dashes(-) corresponding to depth in the tree" do
          expect(subject).to eq(">MyString")
        end
      end
    end
  end
