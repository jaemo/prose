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
  end
end
