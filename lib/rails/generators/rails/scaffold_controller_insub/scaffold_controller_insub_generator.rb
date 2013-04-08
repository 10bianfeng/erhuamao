# -*- encoding : utf-8 -*-
# Insub's InsubScaffold
# how to use: rails g scaffold_controller_insub admin/notes title:string ...
require 'rails/generators/resource_helpers'

module Rails
  module Generators
    class ScaffoldControllerInsubGenerator < NamedBase
      include ResourceHelpers

      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"
      
      check_class_collision :suffix => "Controller"

      class_option :orm, :banner => "NAME", :type => :string, :required => true,
                         :desc => "ORM to generate the controller for"

      def create_controller_files
        template 'controller.rb', File.join('app/controllers', class_path, "#{controller_file_name}_controller.rb")
      end

      hook_for :template_engine, :test_framework, :as => :scaffold_insub

      # Invoke the helper using the controller name (pluralized)
      hook_for :helper, :as => :scaffold_insub do |invoked|
        invoke invoked, [ controller_name ]
      end
    end
  end
end
