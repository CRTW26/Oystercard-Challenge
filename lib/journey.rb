class Journey

 attr_reader :on_journey, :past_journeys, :current_journey

  def intialize
    @on_journey = false
    @past_journeys = []
    @current_journey = {
      "Entry Station" => nil,
      "Exit Station" => nil,
    }
  end
  def touch_in(entry_station)
    journey_history
    #raise "Insufficient balance for journey" if insufficient_funds?
    current_journey["Entry Station"] = :entry_station
    in_journey?
  end

  def in_journey?
  !!entry_station
  #if @current_journey["Entry Station"] == nil && @current_journey["Exit Station"] == nil
  #  @on_journey = false
  #elsif @current_journey["Entry Station"] == :entry_station && @current_journey["Exit Station"] == nil
   #@on_journey = true
  #elsif @current_journey["Entry Station"] == :entry_station && @current_journey["Exit Station"] == :exit_station
  #  @on_journey = false
  #end
end

def touch_out(exit_station)
  #spend(MIN_JOURNEY_COST)
  current_journey["Exit Station"] = :exit_station
  in_journey?
end

def journey_history
#  @past_journeys << @current_journey
#  @current_journey = {
#    "Entry Station" => nil,
#    "Exit Station" => nil,
#  }
end
end
