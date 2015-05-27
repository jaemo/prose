Rails.application.routes.draw do

  mount Prose::Engine => "/prose-admin"
end
