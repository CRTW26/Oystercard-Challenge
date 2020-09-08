require 'Oystercard'

describe Oystercard do

  let(:oystercard) { Oystercard.new(20) }

  describe '#balance' do
    it 'shows the balance of the card' do
      expect(subject.balance).to be 0
    end
  end

  describe '#top_up' do
    it 'adds money to the card' do
      expect { subject.top_up(5) }.to change { subject.balance }.by(5)
    end

    it 'raises error if MAX_LIMIT exceeded' do
      expect { subject.top_up(Oystercard::MAX_AMOUNT + 1) }.to raise_error "Cannot top up: your card reached the limit of £90"
    end
  end

  describe '#spend' do
    it 'subtracts cost of journey from balance' do
      expect { subject.spend(2) }.to change { subject.balance }.by(-2)
    end
  end

  describe '#touch_in' do
    it 'allows user to touch card' do
      expect(oystercard).to respond_to(:touch_in)
    end

    it 'changes on_journey status to true' do
      oystercard.touch_in
      expect(oystercard.on_journey).to be true
    end
  end

  describe '#touch_out' do
    it 'allows user to touch out' do
      expect(oystercard).to respond_to(:touch_out)
    end

    it 'changes on_journey to be false' do
      oystercard.touch_in
      oystercard.touch_out
      expect(oystercard.on_journey).to be false
    end
  end

end
