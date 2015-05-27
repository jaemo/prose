FactoryGirl.define do
  factory :prose_template_region, :class => 'Prose::TemplateRegion' do
    association :template, factory: :prose_template
    association :region, factory: :prose_region
  end

end
