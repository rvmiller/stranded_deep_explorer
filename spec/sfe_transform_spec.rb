require 'spec_helper'

describe 'Save File' do
  let!(:transform_data) {
    {"localPosition"=>{"x"=>"~f-104", "y"=>"~f110.9302", "z"=>"~f88"},
     "localRotation"=>{"x"=>"~f-0.2304509", "y"=>"~f0.7568889", "z"=>"~f0.01571662", "w"=>"~f0.6113629"},
     "localScale"=>{"x"=>"~f1", "y"=>"~f0.9999997", "z"=>"~f0.9999996"}
    }
  }

  before(:each) do
    @transform = SFE::Transform.new(transform_data)
  end

  describe 'Node Transform Class' do

    it 'should have localPosition' do
      expect(@transform.local_position.x).to eq('~f-104')
      expect(@transform.local_position.y).to eq('~f110.9302')
      expect(@transform.local_position.z).to eq('~f88')
    end

    it 'should have localRotation' do
      expect(@transform.local_rotation.x).to eq('~f-0.2304509')
      expect(@transform.local_rotation.y).to eq('~f0.7568889')
      expect(@transform.local_rotation.z).to eq('~f0.01571662')
      expect(@transform.local_rotation.w).to eq('~f0.6113629')
    end

    it 'should have localScale' do
      expect(@transform.local_scale.x).to eq('~f1')
      expect(@transform.local_scale.y).to eq('~f0.9999997')
      expect(@transform.local_scale.z).to eq('~f0.9999996')
    end

  end
end