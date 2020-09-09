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

  def touch_in
  end

end
