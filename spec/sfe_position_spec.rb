require 'spec_helper'

describe 'Node Position Class' do

  it 'should return a new Position object with coordinates' do
    position_data = {"x" => 1, "y" => 2, "z" =>3}
    position = SFE::Position.new(position_data)

    expect(position.x).to eq(1)
    expect(position.y).to eq(2)
    expect(position.z).to eq(3)
    expect(position.w).to eq('?')
  end

  it 'should return a new Position object with w coords if included in the contructor' do
    position_data = {"x" => -1, "y" => 2.0045, "z" =>'3i', 'w' => -14}
    position = SFE::Position.new(position_data)

    expect(position.x).to eq(-1)
    expect(position.y).to eq(2.0045)
    expect(position.z).to eq('3i')
    expect(position.w).to eq(-14)
  end

  it 'should handle an empty data set' do
    position_data = {}
    position = SFE::Position.new(position_data)

    expect(position.x).to eq('?')
    expect(position.y).to eq('?')
    expect(position.z).to eq('?')
    expect(position.w).to eq('?')
  end

  it 'should handle a nil data set' do
    position_data = nil
    position = SFE::Position.new(position_data)

    expect(position.x).to eq('no data')
    expect(position.y).to eq('no data')
    expect(position.z).to eq('no data')
    expect(position.w).to eq('no data')
  end

end