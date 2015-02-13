require 'spec_helper'

describe 'Node Rotation Class' do

  it 'should return a new Rotation object with coordinates' do
    rotation_data = {"x" => '~f0.00056', "y" => '~f-1.5132476', "z" =>'~f3.1111', "w"=>'~f-1.56'}
    rotation = SFE::Rotation.new(rotation_data)

    expect(rotation.x).to eq('~f0.00056')
    expect(rotation.y).to eq('~f-1.5132476')
    expect(rotation.z).to eq('~f3.1111')
    expect(rotation.w).to eq('~f-1.56')
  end

  it 'should handle an empty data set' do
    rotation_data = {}
    rotation = SFE::Rotation.new(rotation_data)

    expect(rotation.x).to eq('?')
    expect(rotation.y).to eq('?')
    expect(rotation.z).to eq('?')
    expect(rotation.w).to eq('?')
  end

  it 'should handle a nil data set' do
    rotation_data = nil
    rotation = SFE::Rotation.new(rotation_data)

    expect(rotation.x).to eq('no data')
    expect(rotation.y).to eq('no data')
    expect(rotation.z).to eq('no data')
    expect(rotation.w).to eq('no data')
  end

end