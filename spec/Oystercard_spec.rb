require "Oystercard"

describe Oystercard do
  let(:oystercard) { Oystercard.new(20) }
  let(:entry_station) { station_double = double :station }
  let(:exit_station) { station_double = double :station }

  it "has an empty array" do
    expect(oystercard.past_journeys).to be_empty
  end

  describe "touching in and out" do
    it "creates one journey" do
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      expect(oystercard.current_journey).to have_value(:entry_station)
      expect(oystercard.current_journey).to have_value(:exit_station)
    end
  end

  describe "#balance" do
    it "shows the balance of the card" do
      expect(subject.balance).to be 0
    end
  end

  describe "#top_up" do
    it "adds money to the card" do
      expect { subject.top_up(5) }.to change { subject.balance }.by(5)
    end

    it "raises error if MAX_LIMIT exceeded" do
      expect { subject.top_up(Oystercard::MAX_AMOUNT + 1) }.to raise_error "Cannot top up: your card reached the limit of GBP90"
    end
  end

  describe "#touch_in" do
    it "allows user to touch card" do
      expect(oystercard).to respond_to(:touch_in)
    end

    it "changes on_journey status to true" do
      oystercard.touch_in(entry_station)
      expect(oystercard.on_journey).to be true
    end

    it "raises an error if card balance is less than minimum amount" do
      card = Oystercard.new
      expect { card.touch_in(entry_station) }.to raise_error "Insufficient balance for journey"
    end

    it "is not expected to raise an error if card balance is more than minimum amount" do
      expect { oystercard.touch_in(entry_station) }.to_not raise_error
    end

=begin  removed as hash now controls the on journey variable
    it "stores users entry station" do
      oystercard.touch_in(entry_station)
      expect(oystercard.entry_station).to eq entry_station
    end
=end
  end

  describe "#touch_out" do
    it "allows user to touch out" do
      expect(oystercard).to respond_to(:touch_out)
    end

    it "changes on_journey to be false" do
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      expect(oystercard.on_journey).to be false
    end

    it "subracts cost of journey from card balance" do
      oystercard.touch_in(entry_station)
      expect { oystercard.touch_out(exit_station) }.to change { oystercard.balance }.by(-Oystercard::MIN_JOURNEY_COST)
    end
  end

end
