module Itamae
  module DefaultAttributes
    module Extension
      def load(vars = {})
        attributes_loader.load
        super
      end

      def attributes_loader
        @attributes_loader ||=
          Itamae::DefaultAttributes::AttributesLoader.new(self, attributes_path)
      end

      def attributes_path
        @attributes_path ||=
          path.sub(%r{[^/]+\.rb$}, "attributes.rb")
      end
    end
  end
end
