# frozen_string_literal: true

module RuboCop
  module Cop
    module Structure
      class CrossComponentOverload < RuboCop::Cop::Cop
        MSG = 'This class is already defined outside this component. Please move it into a namespace'

        def on_class(node)
          filename = node.source_range.source_buffer.name
          # Grab the component and the rails path
          return unless %r{components/(?<component>[^/]+)/(?<path>.+)$} =~ filename
          # Only check app and lib
          return unless %r{^app|lib} =~ path

          matching_core_paths = Dir.glob(path)
          matching_component_paths = Dir
            .glob("components/*/#{path}")
            .reject { |p| p.include?("components/#{component}/") }

          add_offense(node) if matching_core_paths.any? || matching_component_paths.any?
        end
      end
    end
  end
end
