require "Oystercard"

describe Oystercard do
  let(:oystercard) { Oystercard.new(20) }
  

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

#NEEEDS TO BE CHANGED AFTER JOURNEY CLASS BEEN ADDED
    #it "raises an error if card balance is less than minimum amount" do
    #  card = Oystercard.new
    #  expect { card.touch_in(entry_station) }.to raise_error "Insufficient balance for journey"
   # end

    #NEEEDS TO BE CHANGED AFTER JOURNEY CLASS BEEN ADDED
    #it "is not expected to raise an error if card balance is more than minimum amount" do
    #expect { oystercard.touch_in(entry_station) }.to_not raise_error
    #end

=begin  removed as hash now controls the on journey variable
    it "stores users entry station" do
      oystercard.touch_in(entry_station)
      expect(oystercard.entry_station).to eq entry_station
    end
=end


#NEEEDS TO BE CHANGED AFTER JOURNEY CLASS BEEN ADDED
    #it "subracts cost of journey from card balance" do
     # oystercard.touch_in(entry_station)
     # expect { oystercard.touch_out(exit_station) }.to change { oystercard.balance }.by(-Oystercard::MIN_JOURNEY_COST)
   # end
  end

