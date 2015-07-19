class Fleet

  def initialize(ships)
    build(ships)
  end

  def ships
    @ships ||= []
  end

  private

  def build(ships_to_build)
    ships_to_build.each do |ship, quantity|
      quantity.times { ships << ship }
    end
  end


end
