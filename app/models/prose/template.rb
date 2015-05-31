module Prose
  class Template < ActiveRecord::Base
    has_many :pages, class_name: "Prose::Page"
    has_many :template_regions, class_name: "Prose::TemplateRegion"
    has_many :regions, through: :template_regions
  end
end
