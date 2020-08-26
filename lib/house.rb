class House
  attr_reader :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def price
    @price.slice!(0)
    @price.to_i
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    if self.price > 500000
      true
    else
      false
    end
  end

  def rooms_from_category(type)
    @rooms.find_all do |room|
      room.category == type
    end
  end

  def area
    house_area = 0
    @rooms.each do |room|
      house_area += room.area
    end
    return house_area
  end

  def details
    house_details = {}
    house_details["price"] = self.price
    house_details["address"] = @address
    return house_details
  end

  def price_per_square_foot
    cost = self.price.to_f / self.area
    cost.round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by do |room|
      room.area
    end
  end
end