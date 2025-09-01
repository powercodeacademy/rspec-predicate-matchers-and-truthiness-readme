require 'light'
require 'thermostat'
require 'door_lock'

RSpec.describe "Smart Home Integration" do
  let(:light) { Light.new }
  let(:thermostat) { Thermostat.new }
  let(:lock) { DoorLock.new }

  it "can have all devices in default states" do
    expect(light).not_to be_on
    expect(thermostat).not_to be_heating
    expect(lock).to be_locked
  end

  it "can have all devices in active states" do
    light.turn_on
    thermostat.set_temperature(75)
    lock.unlock
    expect(light).to be_on
    expect(thermostat).to be_heating
    expect(lock).not_to be_locked
  end

  it "truthiness and falsiness of device states" do
    expect(light.on?).to be_falsey
    light.turn_on
    expect(light.on?).to be_truthy
    expect(lock.locked?).to be_truthy
    lock.unlock
    expect(lock.locked?).to be_falsey
  end

  pending "lights can be dimmed to a certain level" # for students
  pending "thermostat can be set to cool as well as heat" # for students
end
