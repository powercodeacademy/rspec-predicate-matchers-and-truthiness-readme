require 'thermostat'

RSpec.describe Thermostat do
  let(:thermostat) { Thermostat.new }

  it "is not heating by default" do
    expect(thermostat.heating?).to be_falsey
  end

  it "starts heating if set above 68" do
    thermostat.set_temperature(72)
    expect(thermostat.heating?).to be_truthy
    expect(thermostat).to be_heating
  end

  it "is not heating if set to 68 or below" do
    thermostat.set_temperature(65)
    expect(thermostat.heating?).to be_falsey
    expect(thermostat).not_to be_heating
  end

  it "returns a boolean from heating?" do
    expect([true, false]).to include(thermostat.heating?)
  end
end
