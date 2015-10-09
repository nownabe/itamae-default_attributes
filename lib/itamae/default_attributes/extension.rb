module Itamae
  module DefaultAttributes
    module Extension
      def load(vars = {})
        load_default_attributes
        super
      end

      def load_default_attributes
        return if Itamae::DefaultAttributes.loaded_paths.include?(attributes_path)
        context = Itamae::DefaultAttributes::EvalContext.new
        context.instance_eval(File.read(attributes_path), attributes_path, 1)
        Itamae::DefaultAttributes.loaded_paths << attributes_path
      end

      def attributes_path
        @attributes_path ||=
          path.sub(%r{[^/]+\.rb$}, "attributes.rb")
      end
    end
  end
end
