require 'journey'

describe Journey do

  let(:journey) { Journey.new }
  let(:entry_station) { station_double = double :station }
  let(:exit_station) { station_double = double :station }



  it "has an empty array" do
    expect(journey).to respond_to (:past_journeys)
  end

  describe "touching in and out" do
    it "creates one journey" do
      journey.touch_in(entry_station)
      journey.touch_out(exit_station)
      expect(journey.current_journey).to have_value(:entry_station)
      expect(journey.current_journey).to have_value(:exit_station)
    end
  end

    describe "#touch_in" do
    it "responds to touching in" do
    expect(journey).to respond_to(:touch_in)
    end


    it "changes on_journey status to true" do
      journey.touch_in(entry_station)
      expect(journey.on_journey).to be true
    end
  end
    describe "#touch_out" do
    it "allows user to touch out" do
      expect(journey).to respond_to(:touch_out)
    end
  end

    it "changes on_journey to be false" do
      journey.touch_in(entry_station)
      journey.touch_out(exit_station)
      expect(journey.on_journey).to be false
    end

end
