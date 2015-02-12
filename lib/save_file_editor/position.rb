class InvalidCoordinateFormatException < RuntimeError; end

class SFE::Position
  attr_reader :x, :y, :z, :w

  def initialize(coords)
    validate(coords)
    @x = coords.fetch("x")
    @y = coords.fetch("y")
    @z = coords.fetch("z")
    @w = coords.fetch("w", nil)
  end

  private
  def validate(coords)
    unless coords.is_a?(Hash) and coords.has_key?("x") and coords.has_key?("y") and coords.has_key?("z")
      raise InvalidCoordinateFormatException.new("Expected a hash of xyz coordinates")
    end

    return "coordinates ok"
  end

end