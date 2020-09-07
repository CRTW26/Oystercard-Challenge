require 'Oystercard'

describe Oystercard do

  it 'shows the balance of the card' do
    expect(subject.balance).to be 0
  end

end
