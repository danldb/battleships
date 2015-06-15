class Ship

  attr_reader :length

  def initialize(length: 1)
    self.sunk = false
    self.length = length
  end

  def hit
    self.sunk = true
  end

  def sunk?
    sunk
  end

  private

  attr_accessor :sunk
  attr_writer :length

end
