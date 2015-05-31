FactoryGirl.define do
  factory :prose_region, :class => 'Prose::Region' do
    name "MyString"
    placeholder "region"
  end

  trait :another_region do
    placeholder "another_region"
  end

end
