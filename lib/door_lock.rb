class DoorLock
  def initialize
    @locked = true
  end

  def lock
    @locked = true
  end

  def unlock
    @locked = false
  end

  def locked?
    @locked
  end
end
