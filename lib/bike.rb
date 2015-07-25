class Bike
  attr_reader :working
  def initialize
    @working = true
  end

  def working?
    @working == true
  end

  def broken?
    @working == false
  end

  def report_broken
    @working = false
  end

  def fix
    @working = true
  end
end
