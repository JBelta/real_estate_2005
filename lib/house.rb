require './lib/room'

class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price.delete("$").to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end
  def above_market_average?
    @price > 500000
  end

  def rooms_from_category(category)
    @rooms.find_all do |room|
      category == room.category
    end
  end

  def details
    {"price" => @price, "address" => @address}
  end

  def price_per_square_foot
    total_sqft = @rooms.sum do |room|
      sum = 0
      sum += (room.length * room.width.to_i)
    end
    total = @price.to_f / total_sqft.to_f
    total.round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort { |room| room.area}
  end
  
end
