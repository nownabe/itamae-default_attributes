module Itamae
  module DefaultAttributes
    class AttributesLoader
      class << self
        def loaded?(path)
          loaded_paths.include?(path)
        end

        def loaded_paths
          @loaded_paths ||= []
        end
      end

      attr_reader :recipe, :path

      def initialize(recipe, path)
        @recipe = recipe
        @path = path
      end

      def load
        return if self.class.loaded?(path)
        return unless File.exist?(path)

        instance_eval(File.read(path), path, 1)
        self.class.loaded_paths << path
      end

      private

      def attributes(attributes_hash)
        recipe.runner.node.reverse_merge!(attributes_hash)
      end
    end
  end
end
