require_relative './alien'
require_relative './modules'

class AlienB < Alien
  attr_reader :arms
  include CanJump
  include CanFly

  def initialize(name, age, arms)
    super(name, age)
    @items[:drums] = 1
    @arms = arms
  end

  def arms=(arms)
    unless arms.is_a? Integer
      raise "Must indicate the number of arms with an integer"
    end
    if arms >= 2
      @arms = arms
    else
      raise "Arms must be a number greater than or equal to 2"
    end
  end

  def play_drums
    if (items[:drums] > 0)
      "#{name} plays the drums!"
    else
      "#{name} doesn't have any drums!"
    end
  end

  def move
    "#{name} dances!"
  end
end