require 'minitest/autorun'
require_relative '../alien_a'
require_relative '../alien_b'
require_relative '../alien_c'

class TestAlien < Minitest::Test
  def test_instance_of
    alien = AlienA.new("name", 34, 3)
    assert_instance_of(AlienA, alien)
  end

  def test_super_class_attribute
    alien = AlienA.new("name", 34, 3)
    refute_nil(alien.name)
  end 

  def test_give_item
    alien_1 = AlienA.new("name 1", 34, 3)
    alien_2 = AlienA.new("name 2", 34, 3)
    alien_1.give_item(:apples, 3, alien_2)
    refute_equal(5, alien_1.items[:apples])
    assert_equal(8, alien_2.items[:apples])
  end

  def test_give_item_doesnt_have
    alien_1 = AlienA.new("name 1", 34, 3)
    alien_2 = AlienB.new("name 2", 34, 3)
    assert_raises(RuntimeError) { alien_1.give_item(:grapes, 3, alien_2) } 
    refute_equal(3, alien_2.items[:grapes])
  end

  def test_receive_item
    alien = AlienA.new("name 1", 34, 3)
    alien.receive_item(:apples, 5)
    assert_equal(10, alien.items[:apples])
  end

  def test_receive_item_doesnt_have
    alien = AlienA.new("name 1", 34, 3)
    assert_raises(RuntimeError) { alien.receive_item(:drums, 5) }
  end

  def test_speak
    alien = AlienA.new("name 1", 34, 3)
    assert_equal("name 1 says hi!", alien.speak)
  end

  def test_throw_grape
    alien_1 = AlienA.new("name 1", 34, 3)
    alien_2 = AlienB.new("name 2", 34, 3)
    assert_output(/name 1 throws a grape at name 2/) { puts alien_1.throw_grape(alien_2) }
  end

  def test_play_drums
    alien = AlienB.new("name 2", 34, 3)
    assert_equal("name 2 plays the drums!", alien.play_drums)
  end

  def test_shoot_lasers
    alien = AlienC.new("name 2", 34, 3)
    assert_equal("name 2 is shooting lasers.", alien.start_shooting_lasers)
  end

  def test_long_jump
    alien = AlienC.new("name 2", 34, 3)
    assert_equal("name 2 jumps really far!", alien.long_jump)
  end
end