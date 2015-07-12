class Ship

  attr_reader :length

  def initialize(length: 2)
    self.sunk = false
    self.length = length
    self.lives = length
  end

  def hit
    self.sunk = true
  end

  def sunk?
    sunk
  end

  private

  attr_accessor :sunk, :lives
  attr_writer :length

end
