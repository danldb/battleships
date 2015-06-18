class Board

  attr_reader :rows

  def initialize(width: 10, height: 10)
    self.width = width
    self.height = height
    generate_rows
  end

  def shoot(coords)
    rows[coords[0]][coords[1]].hit
  end

  private

  attr_writer :rows
  attr_accessor :width, :height

  def generate_rows
    self.rows = []
    row = Array.new(width)
    height.times { rows << row.dup }
  end

end
