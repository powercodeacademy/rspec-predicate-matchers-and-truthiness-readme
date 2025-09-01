require 'door_lock'

RSpec.describe DoorLock do
  let(:lock) { DoorLock.new }

  it "is locked by default" do
    expect(lock.locked?).to be_truthy
    expect(lock).to be_locked
  end

  it "can be unlocked" do
    lock.unlock
    expect(lock.locked?).to be_falsey
    expect(lock).not_to be_locked
  end

  it "can be locked again after unlocking" do
    lock.unlock
    lock.lock
    expect(lock.locked?).to be_truthy
    expect(lock).to be_locked
  end

  it "returns a boolean from locked?" do
    expect([true, false]).to include(lock.locked?)
  end
end
