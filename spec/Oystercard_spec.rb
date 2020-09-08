require 'Oystercard'

describe Oystercard do

  it 'shows the balance of the card' do
    expect(subject.balance).to be 0
  end

  it 'adds money to the card' do
    expect { subject.top_up(5) }.to change { subject.balance }.by(5)
  end

  it 'raises error if MAX_LIMIT exceeded' do
    expect { subject.top_up(Oystercard::MAX_AMOUNT + 1) }.to raise_error "Cannot top up: your card reached the limit of £90"
  end

  it 'subtracts cost of journey from balance' do
    expect { subject.spend(2) }.to change { subject.balance }.by(-2)
  end

end
