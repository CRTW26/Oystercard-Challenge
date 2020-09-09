require 'station'

describe Station do

  let(:station) { Station.new("Waterloo", 1) }

  it 'has name' do
    expect(station.name).to eq "Waterloo"
  end

  it 'is in zone' do
    expect(station.zone).to eq 1
  end

end
