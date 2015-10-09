module Itamae
  module DefaultAttributes
    class EvalContext
      attr_reader :recipe

      def initialize(recipe)
        @recipe = recipe
      end

      def attributes(attributes_hash)
        recipe.runner.node.reverse_merge!(attributes_hash)
      end
    end
  end
end
