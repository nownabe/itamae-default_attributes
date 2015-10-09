require "itamae/default_attributes/version"

module Itamae
  module DefaultAttributes
  end
end

require "itamae/default_attributes/attributes_loader"
require "itamae/default_attributes/extension"

require "itamae/recipe"

Itamae::Recipe.send(:prepend, Itamae::DefaultAttributes::Extension)
