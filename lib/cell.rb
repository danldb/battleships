class Cell

  def hold(hittable)
    self.contents = hittable
  end

  def hit!
    unless hit?
      self.hit = true
      contents.hit
    end
  end

  private

  def hit?
    hit
  end

  attr_accessor :hit
  attr_accessor :contents

end
