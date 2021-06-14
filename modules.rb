module CanJump
  def long_jump
    "#{name} jumps really far!"
  end

  def short_jump
    "#{name} hops."
  end
end

module CanShootLasers
  def start_shooting_lasers
    "#{name} is shooting lasers."
  end

  def stop_shooting_lasers
    "#{name} stops shooting lasers."
  end
end

module CanFly
  def fly 
    "#{name} starts flying."
  end

  def land 
    "#{name} lands on the ground."
  end
end

