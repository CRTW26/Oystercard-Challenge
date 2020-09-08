class Oystercard

  attr_reader :balance

  DEFAULT_BALANCE = 0
  MAX_AMOUNT = 90

    def initialize(balance= DEFAULT_BALANCE)
      @balance = balance

    end

    def top_up(amount)
      raise "Cannot top up: your card reached the limit of £#{MAX_AMOUNT}" if @balance + amount > MAX_AMOUNT
      @balance += amount
    end

    def spend(cost)
      @balance -= cost
    end
end
