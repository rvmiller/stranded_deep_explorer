require 'spec_helper'

describe 'Save File Node' do
  let!(:full_node_data) {
    {
      "name" => "test_node_name",
      "biome"=> "SHALLOW_SAND_PLAINS",
      "fullyGenerated" =>true,
      "heightValue"=>"~i4",
      "seedEffect"=>"~i466",
      "position"=>{"x"=>"~f256","y"=>"~f-129","z"=>"~f256"},
      "positionOffset"=>{"x"=>"~f256","y"=>"~f129","z"=>"~f0"},
      "Objects"=>{
        "[0]SHIPWRECK_2A(Clone)"=> {
          "name"=>"SHIPWRECK_2A(Clone)",
          "reference"=>"e818e3f4-f0e8-4f0b-9095-c8631f65d417",
          "prefab"=>"7011c1ea-19dc-4659-b322-55e8c19810cf",
          "GameObject"=> {
            "active"=>true,
            "layer"=>"TerrainObjects",
            "tag"=>"Untagged"
          },
          "Transform"=>{
            "localPosition"=>{
              "x"=>"~f-104",
              "y"=>"~f110.9302",
              "z"=>"~f88"
            },
            "localRotation"=>{
              "x"=>"~f-0.2304509",
              "y"=>"~f0.7568889",
              "z"=>"~f0.01571662",
              "w"=>"~f0.6113629"
            },
            "localScale"=>{
              "x"=>"~f1",
              "y"=>"~f0.9999997",
              "z"=>"~f0.9999996"
            }
          },
          "containersGenerated"=>true
        },
        "[1]SHIPWRECK_6A(Clone)"=>{
          "name"=>"SHIPWRECK_6A(Clone)",
          "reference"=>"7b59eb74-8fda-4fd1-a455-9f77397ef7b6",
          "prefab"=>"afac356f-1673-4393-926c-524e43c1b7b7",
          "GameObject"=>{
            "active"=>true,
            "layer"=>"TerrainObjects",
            "tag"=>"Untagged"
          },
          "Transform"=>{
              "localPosition"=>{
                "x"=>"~f-80",
                "y"=>"~f104.3133",
                "z"=>"~f40"
              },
              "localRotation"=>{
                "x"=>"~f0.1997195",
                "y"=>"~f0.9727799",
                "z"=>"~f-0.004485163",
                "w"=>"~f-0.1174365"
              },
              "localScale"=>{
                "x"=>"~f0.9999989",
                "y"=>"~f1",
                "z"=>"~f0.9999965"
              }
          },
          "containersGenerated"=>true
        }
      }
    }
  }

  let(:partial_node_data) {
    {
      "name" => "partial_node_name",
      "biome"=> "BOTTOMLESS",
      "fullyGenerated" =>false,
      "position"=>{"x"=>"~f256","y"=>"~f-129","z"=>"~f256"}
    }
  }

  let(:corrupt_node_data) {
    {
      "fullyGenerated" =>false,
      "position"=>{"x"=>"~f256","y"=>"~f-129","z"=>"~f256"}
    }
  }

  before(:each) do
    @full_node = SFE::Node.new(full_node_data)
    @partial_node = SFE::Node.new(partial_node_data)
    @corrupt_node = SFE::Node.new(corrupt_node_data)
  end

  describe 'Viewer/Editor class' do

    it 'returns a new node object when given node data' do
      expect(@full_node).not_to be_nil
    end

    it 'can parse the node name' do
      expect(@full_node.name).to eq('test_node_name')
    end

    it 'can parse the node biome' do
      expect(@full_node.biome).to eq('SHALLOW_SAND_PLAINS')
    end

    it 'can parse the fullyGenerated flag' do
      expect(@full_node.fully_generated).to eq(true)
    end

    it 'can parse the node position' do
      expect(@full_node.position.x).to eq("~f256")
      expect(@full_node.position.y).to eq("~f-129")
      expect(@full_node.position.z).to eq("~f256")
    end

    it 'can parse the node objects' do
      expect(@full_node.objects).not_to be_empty

      id = 0
      @full_node.objects.each do |obj|
        expect(obj.id).to eq(id)
        expect(obj.name).to match(/SHIPWRECK/)
        expect(obj.containers_generated?).to eq(true)

        id += 1
      end
    end

    it 'can parse the bare data when a node is not fully generated' do
      expect(@partial_node.name).to eq('partial_node_name')
      expect(@partial_node.biome).to eq('BOTTOMLESS')
      expect(@partial_node.fully_generated).to eq(false)
      expect(@partial_node.position.x).to eq("~f256")
      expect(@partial_node.position.y).to eq("~f-129")
      expect(@partial_node.position.z).to eq("~f256")
    end

    it 'can handle a node with missing name' do
      expect(@corrupt_node.name).to eq('unknown')
    end

    it 'can handle a node with missing biome' do
      expect(@corrupt_node.biome).to eq('unknown')
    end


  end

end