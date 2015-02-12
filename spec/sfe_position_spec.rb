require 'spec_helper'

describe 'Node Position Class' do

  it 'should return a new Position object with coordinates' do
    position_data = {"x" => 1, "y" => 2, "z" =>3}
    position = SFE::Position.new(position_data)

    expect(position.x).to eq(1)
    expect(position.y).to eq(2)
    expect(position.z).to eq(3)
    expect(position.w).to be_nil
  end

  it 'should return a new Position object with w coords if included in the contructor' do
    position_data = {"x" => -1, "y" => 2.0045, "z" =>'3i', 'w' => -14}
    position = SFE::Position.new(position_data)

    expect(position.x).to eq(-1)
    expect(position.y).to eq(2.0045)
    expect(position.z).to eq('3i')
    expect(position.w).to eq(-14)
  end
end