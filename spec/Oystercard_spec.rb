require 'Oystercard'

describe Oystercard do

  it 'shows the balance of the card' do
    expect(subject.balance).to be 0
  end

  it 'adds money to the card' do
    expect { subject.top_up(5) }.to change { subject.balance }.by(5)
  end

end
