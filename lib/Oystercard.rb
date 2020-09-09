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

  def touch_in(entry_station)
    journey_history
    raise "Insufficient balance for journey" if insufficient_funds?
    current_journey["Entry Station"] = :entry_station
    in_journey?
  end

  def touch_out(exit_station)
    spend(MIN_JOURNEY_COST)
    current_journey["Exit Station"] = :exit_station
    in_journey?
  end

  def journey_history
    @past_journeys << @current_journey
    @current_journey = {
      "Entry Station" => nil,
      "Exit Station" => nil,
    }
  end

  private

  def insufficient_funds?
    @balance < MIN_JOURNEY_COST
  end

  def spend(cost)
    @balance -= cost
  end

  def in_journey?
    if @current_journey["Entry Station"] == nil && @current_journey["Exit Station"] == nil
      @on_journey = false
    elsif @current_journey["Entry Station"] == :entry_station && @current_journey["Exit Station"] == nil
      @on_journey = true
    elsif @current_journey["Entry Station"] == :entry_station && @current_journey["Exit Station"] == :exit_station
      @on_journey = false
    end
  end

=begin
  def in_journey?
    if @entry_station.nil?
      @on_journey = false
    else
      @on_journey = true
=end
end
