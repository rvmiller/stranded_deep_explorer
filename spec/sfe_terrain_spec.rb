require 'spec_helper'

describe 'Terrain Parser' do
  let(:terrain_data) {
    {
        "name" => "partial_node_name",
        "biome"=> "BOTTOMLESS",
        "fullyGenerated" =>false,
        "position"=>{"x"=>"~f256","y"=>"~f-129","z"=>"~f256"}
    }
  }

end