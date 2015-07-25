class Van
  include BikeContainer

  def load(bike)
    add_bike(bike)
  end

  def unload
    remove_bike
  end
end
