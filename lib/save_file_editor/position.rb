module SFE
  class InvalidCoordinateFormatException < RuntimeError; end

  class Position < AbstractObject
    attr_reader :data, :x, :y, :z, :w

    def initialize(position_data)
      @data = position_data

      @x = get_position("x")
      @y = get_position("y")
      @z = get_position("z")
      @w = get_position("w")
    end

    private
    def get_position(axis)
      fetch axis, :from => data, :default => default_position
    end

    def default_position
      '?'
    end

  end

end