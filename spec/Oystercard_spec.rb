require 'Oystercard'

describe Oystercard do

  it 'shows the balance of the card' do
    expect(subject.balance).to be 0
  end

  it 'adds money to the card' do
    expect { subject.top_up(5) }.to change { subject.balance }.by(5)
  end

  it 'sets a limit of £90 to the card' do
    expect { subject.top_up(100) }.to raise_error "Cannot top up: your card reached the limit of £90"
  end

  it 'subtracts cost of journey from balance' do
    expect { subject.spend(2) }.to change { subject.balance }.by(-2)
  end

end
