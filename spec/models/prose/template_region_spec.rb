require 'rails_helper'

module Prose
  RSpec.describe TemplateRegion, type: :model do
    let(:template_region){ create(:prose_template_region) }

    subject{ described_class.new }

    describe "associations" do
      specify{ subject.should belong_to(:template)}
      specify{ subject.should belong_to(:region) }
    end

    describe "validity" do
      it "is invalid without a template" do
        subject.template = nil
        expect(subject).to_not be_valid
      end

      it "is invalid without a region" do
        subject.region = nil
        expect(subject).to_not be_valid
      end
    end
  end
end
