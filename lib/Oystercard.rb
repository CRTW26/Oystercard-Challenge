class Oystercard
  attr_reader :balance, :on_journey, :journey_cost

  DEFAULT_BALANCE = 0
  MAX_AMOUNT = 90
  MIN_JOURNEY_COST = 1

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @on_journey = false
  end

  def top_up(amount)
    raise "Cannot top up: your card reached the limit of GBP#{MAX_AMOUNT}" if @balance + amount > MAX_AMOUNT
    @balance += amount
  end

  def touch_in
    raise "Insufficient balance for journey" if insufficient_funds?
    @on_journey = true
  end

  def touch_out
    spend(MIN_JOURNEY_COST)
    @on_journey = false
  end

  private

  def insufficient_funds?
    @balance < MIN_JOURNEY_COST
  end

    def spend(cost)
      @balance -= cost
    end

end
