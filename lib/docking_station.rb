require_relative 'bike'
require_relative 'bike_container'

class DockingStation
  include BikeContainer

  def release_bike
    fail 'No bikes available' if bikes.empty?
    fail 'No working bikes available' if working_bikes.empty?
    bikes.delete working_bikes.pop
  end

  def dock(bike)
    fail 'Not a bike' unless bike.respond_to?(:broken?)
    add_bike bike
  end

  def release_broken_bike
    fail 'No bikes available' if bikes.empty?
    fail 'No broken bikes available' if broken_bikes.empty?
    bikes.delete broken_bikes.pop
  end

  def release_specific_bike(n)
    bikes.delete working_bikes[n]
  end

  private

  def working_bikes
    bikes.reject { |bike| bike.broken? }
  end

  def broken_bikes
    bikes.select { |bike| bike.broken? }
  end
end
