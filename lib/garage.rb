require_relative 'bike'

class Garage
  include BikeContainer

  def fix_bikes
    bikes.map { |bike| bike.fix }
  end
end
