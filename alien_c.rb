require_relative './alien'

class AlienC < Alien
  attr_reader :eyes
  
  def initialize(name, age, eyes)
    super(name, age)
    @items[:glasses] = 1
    @eyes = eyes
  end

  def eyes=(eyes)
    unless eyes.is_a? Integer
      raise "Must indicate the number of arms with an integer"
    end
    if eyes >= 2
      @eyes = eyes
    else
      raise "Eyes must be a number greater than or equal to 2"
    end
  end

  def speak
    "#{name} said 'Kulaq w'ajj, hwa-ksh brraglac!'"
  end

  def sing 
    "#{name} sings!"
  end
end