class Oystercard

  attr_reader :balance

  DEFAULT_BALANCE = 0
  MAX_AMOUNT = 90 

    def initialize(balance= DEFAULT_BALANCE)
      @balance = balance
      
    end

    def top_up(amount)
      @balance += amount
      if amount > MAX_AMOUNT
        raise "Cannot top up: your card reached the limit of £#{MAX_AMOUNT}" 
      else
        'Your card was topped up successfully.'
      end
    end
end
