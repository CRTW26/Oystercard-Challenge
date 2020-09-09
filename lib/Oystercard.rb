class Oystercard
  attr_reader :balance

  DEFAULT_BALANCE = 0
  MAX_AMOUNT = 90
  MIN_JOURNEY_COST = 1

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(amount)
    raise "Cannot top up: your card reached the limit of GBP#{MAX_AMOUNT}" if @balance + amount > MAX_AMOUNT
    @balance += amount
  end



  private

  def insufficient_funds?
    @balance < MIN_JOURNEY_COST
  end

  def spend(cost)
    @balance -= cost
  end



=begin
  def in_journey?
    if @entry_station.nil?
      @on_journey = false
    else
      @on_journey = true
=end
end
