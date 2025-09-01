require 'light'

RSpec.describe Light do
  let(:light) { Light.new }

  it "is off by default" do
    expect(light.on?).to be_falsey
    expect(light).not_to be_on
  end

  it "can be turned on" do
    light.turn_on
    expect(light.on?).to be_truthy
    expect(light).to be_on
  end

  it "can be turned off after being on" do
    light.turn_on
    light.turn_off
    expect(light.on?).to be_falsey
    expect(light).not_to be_on
  end

  it "returns a boolean from on?" do
    expect([true, false]).to include(light.on?)
  end
end
