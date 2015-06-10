require 'rails/generators'
require 'rails/generators/migration'

module Prose
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def mount_engine
        route "mount Prose::Engine => '/'"
      end

    end
  end
end
