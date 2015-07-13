module Prose
  class TemplateRegion < ActiveRecord::Base
    belongs_to :template, class_name: "Prose::Template"
    belongs_to :region, class_name: "Prose::Region"

    validates :region, :template, presence: true
  end
end
