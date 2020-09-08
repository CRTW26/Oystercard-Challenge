class Oystercard
  attr_reader :balance, :on_journey, :entry_station

  DEFAULT_BALANCE = 0
  MAX_AMOUNT = 90
  MIN_JOURNEY_COST = 1

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @on_journey = false
    @entry_station = nil
  end

  def top_up(amount)
    raise "Cannot top up: your card reached the limit of GBP#{MAX_AMOUNT}" if @balance + amount > MAX_AMOUNT
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient balance for journey" if insufficient_funds?
    @entry_station = station
    in_journey?
  end

  def touch_out
    spend(MIN_JOURNEY_COST)
    @entry_station = nil
    in_journey?
  end

  private

  def insufficient_funds?
    @balance < MIN_JOURNEY_COST
  end

  def spend(cost)
    @balance -= cost
  end

  def in_journey?
    if @entry_station.nil?
      @on_journey = false
    else
      @on_journey = true
    end
  end

end
