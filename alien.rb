class Alien
  attr_reader :name, :age, :items

  def initialize(name, age)
    @name = name
    @age = age
    @items = Hash.new
    @items[:money] = 5
    @items[:apples] = 5
    @items[:oranges] = 5
  end

  def name=(name)
    unless name.is_a? String 
      raise "Name must be a string!"
    else
      if name.empty?
        raise "Name must not be an empty string!"
      else
        @name = name
      end
    end
  end

  def age=(age)
    unless age.is_a? Integer 
      raise "Age must be an integer!"
    else
      if age <= 0
        raise "Age must be greater than 0!"
      else
        @age = age
      end
    end
  end

  def move
    "#{name} makes a move!"
  end

  def speak
    "#{name} says hi!"
  end

  def give_item(item, qty, receiver)
    if @items.has_key?(item) && receiver.items.has_key?(item) && @items[item] >= qty
      @items[item] -= qty
      receiver.receive_item(item, qty)
    else
      raise "Cannot give #{item} to #{receiver.name}."
    end
  end

  def receive_item(item, qty)
    # key check was done in give_item.
    if @items.has_key?(item)
      @items[item] += qty
    else
      raise "#{name} cannot receive #{item}."
    end
  end
end