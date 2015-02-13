require 'spec_helper'

describe 'Save File Node Object' do
  let!(:full_object_data) {
    {
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
    }
  }

  let(:partial_object_data) {
    {
        "name" => "SHIPWRECK_2A(Clone)",
        "GameObject"=> {
            "active"=>true,
            "layer"=>"TerrainObjects",
            "tag"=>"Untagged"
        }
    }
  }

  before(:each) do
    @full_object    = SFE::NodeObject.new(1, full_object_data)
    @partial_object = SFE::NodeObject.new(1, partial_object_data)
    @empty_object   = SFE::NodeObject.new(1, {})
    @nil_object     = SFE::NodeObject.new(1, nil)
  end

  describe 'Viewer/Editor class' do

    it 'returns a new object when given node data' do
      expect(@full_object).not_to be_nil
    end

    it 'can parse the id' do
      expect(@full_object.id).to eq(1)
    end

    it 'can parse the name' do
      expect(@full_object.name).to eq('SHIPWRECK_2A(Clone)')
    end

    it 'can parse the GameObject' do
      expect(@full_object.game_object).to eq({"active"=>true,"layer"=>"TerrainObjects", "tag"=>"Untagged"})
    end

    it 'can parse the containersGenerated flag' do
      expect(@full_object.containers_generated?).to eq(true)
    end

    it 'can parse the object transform position' do
      expect(@full_object.transform.local_position.x).to eq("~f-104")
      expect(@full_object.transform.local_position.y).to eq("~f110.9302")
      expect(@full_object.transform.local_position.z).to eq("~f88")
    end

    it 'can parse the object transform rotation' do
      expect(@full_object.transform.local_rotation.x).to eq("~f-0.2304509")
      expect(@full_object.transform.local_rotation.y).to eq("~f0.7568889")
      expect(@full_object.transform.local_rotation.z).to eq("~f0.01571662")
      expect(@full_object.transform.local_rotation.w).to eq("~f0.6113629")
    end

    it 'can parse the object transform scale' do
      expect(@full_object.transform.local_scale.x).to eq("~f1")
      expect(@full_object.transform.local_scale.y).to eq("~f0.9999997")
      expect(@full_object.transform.local_scale.z).to eq("~f0.9999996")
    end

    it 'can handle partial object data' do
      expect(@partial_object.id).to eq(1)
      expect(@partial_object.name).to eq('SHIPWRECK_2A(Clone)')
      expect(@partial_object.transform.local_position.x).to eq('?')
      expect(@partial_object.transform.local_rotation.y).to eq('?')
      expect(@partial_object.transform.local_scale.z).to eq('?')
    end

    it 'can handle empty object data' do
      expect(@nil_object.id).to eq(1)
      expect(@empty_object.name).to eq('unknown')
    end

    it 'can handle a missing transform' do
      expect(@empty_object.transform.local_scale.x).to eq('?')
    end

    it 'can handle nil object data' do
      expect(@nil_object.id).to eq(1)
    end

  end

end