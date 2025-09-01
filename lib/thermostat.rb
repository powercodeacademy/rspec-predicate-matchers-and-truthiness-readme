class Thermostat
  attr_reader :temperature

  def initialize
    @temperature = 68
    @heating = false
  end

  def set_temperature(temp)
    @temperature = temp
    @heating = temp > 68
  end

  def heating?
    @heating
  end
end
