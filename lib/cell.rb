class Cell

  def hold(hittable)
    self.contents = hittable
  end

  def shoot
    unless been_hit?
      self.been_hit = true
      contents.hit
    end
  end

  private

  def been_hit?
    been_hit
  end

  attr_accessor :been_hit
  attr_accessor :contents

end
