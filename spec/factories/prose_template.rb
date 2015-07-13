FactoryGirl.define do
  factory :prose_template, :class => 'Prose::Template' do
    name "Home"
    file_name "home.html"
  end

  trait :content_page do
    name "Content Page"
    file_name "content.html"
  end

end
