require_relative './alien'
require_relative './modules'

class AlienA < Alien
  attr_reader :mouths
  include CanShootLasers
  include CanFly

  def initialize(name, age, mouths)
    super(name, age)
    @items[:grapes] = rand(0..10)
    @mouths = mouths
  end

  def mouths=(mouths)
    unless mouths.is_a? Integer
      raise "Must indicate the number of mouths with an integer"
    end
    if mouths > 0
      @mouths = mouths
    else
      raise "Mouths must be a positive number"
    end
  end

  def throw_grape(throw_at)
    if (items[:grapes] > 0)
      @items[:grapes] -= 1
      "#{name} throws a grape at #{throw_at.name}!"
    else
      "#{name} doesn't have a grape to throw!"
    end
  end

  def eat_grape
    if (items[:grapes] >= mouths)
      @items[:grapes] -= mouths
      "#{name} eats a grape!"
    else
      "#{name} doesn't have a grape to eat!"
    end
  end

  def receive_item(item, qty)
    # key check was done in give_item.
    super(item, qty)
    @items[:grape] += 1 # add a grape too cause why not
  end
end