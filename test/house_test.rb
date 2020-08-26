require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test

  def test_it_exists
    house = House.new("$400000", "123 sugar lane")
    assert_instance_of House, house
  end

  def test_price
    house = House.new("$400000", "123 sugar lane")
    assert_equal 400000, house.price
  end

  def test_readable_address
    house = House.new("$400000", "123 sugar lane")
    assert_equal "123 sugar lane", house.address
  end

  def test_house_has_no_rooms_to_start
    house = House.new("$400000", "123 sugar lane")
    assert_equal [], house.rooms
  end

  def test_rooms_can_be_added
    house = House.new("$400000", "123 sugar lane")
    assert_equal [], house.rooms
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    house.add_room(room_1)
    house.add_room(room_2)
    assert_equal [room_1, room_2], house.rooms
  end

  def test_if_house_is_above_market_average
    house_1 = House.new("$400000", "123 sugar lane")
    refute house_1.above_market_average?
    house_2 = House.new("500000", "742 Evergreen Terrace")
    refute house_2.above_market_average?
    house_3 = House.new("$500001", "1630 Revello Drive")
    assert house_3.above_market_average?

  end

  def test_list_rooms_by_category
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)
    assert_equal [room_1, room_2], house.rooms_from_category(:bedroom)
    assert_equal [room_4], house.rooms_from_category(:basement)
  end

  def test_total_house_square_feet
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)
    assert_equal 1900, house.area
  end
end