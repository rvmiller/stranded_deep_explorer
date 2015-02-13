sfe_dir = File.expand_path('../save_file_editor', __FILE__)

module SFE
  # basically a namespace container
end

# include sub-module classes
require_relative sfe_dir + '/abstract_object.rb'
require_relative sfe_dir + '/node_object.rb'
require_relative sfe_dir + '/node.rb'
require_relative sfe_dir + '/parser.rb'
require_relative sfe_dir + '/position.rb'
require_relative sfe_dir + '/save_file.rb'
require_relative sfe_dir + '/terrain.rb'