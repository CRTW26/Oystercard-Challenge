require 'journey'

describe Journey do

  let(:journey) { Journey.new }
  let(:entry_station) { station_double = double :station }
  let(:exit_station) { station_double = double :station }


  it 'responds to touching in' do
    expect(journey).to respond_to(:touch_in)
  end

  it "has an empty array" do
    expect(journey).to respond_to (:past_journeys)
  end

  describe "touching in and out" do
    it "creates one journey" do
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      expect(oystercard.current_journey).to have_value(:entry_station)
      expect(oystercard.current_journey).to have_value(:exit_station)
    end
  end

end
