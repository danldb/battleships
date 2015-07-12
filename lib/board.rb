class Board

  attr_reader :rows

  def initialize(width: 10, height: 10, contents_class: Water)
    self.width = width
    self.height = height
    generate_rows(contents_class)
  end

  def shoot(coords:, shot:)
    shots << shot
    rows[coords[0]][coords[1]].hit(shot)
  end

  def place(hittable:,coords:)
    rows[coords[0]][coords[1]] = hittable
  end

  def shots
    @shots ||= []
  end

  private

  attr_writer :rows
  attr_accessor :width, :height

  def generate_rows(contents_class)
    self.rows = []
    row = Array.new(width, contents_class.new)
    height.times { rows << row.dup }
  end

end
