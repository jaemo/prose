FactoryGirl.define do
  factory :prose_page, :class => 'Prose::Page' do
    title "MyString"
    template_id 1
    menu_title "MyString"
    body_class "MyString"
    hide_title "MyString"
    meta_description "MyString"
    meta_keywords "MyString"
    visible false
    active false
    meta_title "MyString"
  end

  trait :child_page do
    title "Child Page"
    menu_title "Child Page"
  end

end
