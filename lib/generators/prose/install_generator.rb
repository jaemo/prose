require 'rails/generators'
require 'rails/generators/migration'

module Prose
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      desc "Generates Migrations for Models"

      def self.next_migration_number(dirname)
        Time.now.strftime("%Y%m%d%H%M%S")
      end

      def mount_engine
        route "mount Prose::Engine => '/'"
      end

    end
  end
end
