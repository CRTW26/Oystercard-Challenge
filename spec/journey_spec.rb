require 'journey'

describe Journey do

  let(:journey) { Journey.new }

  it 'responds to touching in' do
    expect(journey).to respond_to(:touch_in)
  end

end
