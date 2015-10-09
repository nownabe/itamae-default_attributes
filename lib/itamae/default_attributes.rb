require "itamae/default_attributes/version"

module Itamae
  module DefaultAttributes
    def self.loaded_paths
      @loaded_paths ||= []
    end
  end
end

require "itamae/default_attributes/eval_context"
require "itamae/default_attributes/extension"

Itamae::Recipe.send(:prepend, Itamae::DefaultAttributes::Extension)
