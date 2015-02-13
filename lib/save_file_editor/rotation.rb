module SFE

  class Rotation < AbstractObject
    attr_reader :data, :x, :y, :z, :w

    def initialize(rotation_data)
      @data = rotation_data

      @x = get_rotation('x')
      @y = get_rotation('y')
      @z = get_rotation('z')
      @w = get_rotation('w')
    end

    def get_rotation(axis)
      fetch axis, :from => data, :default => default_rotation
    end

    def get_tait_brian_angles

    end

    def default_rotation
      '?'
    end

  end

end