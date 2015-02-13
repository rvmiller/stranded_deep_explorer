module SFE

  class Transform < AbstractObject
    attr_reader :data, :local_position, :local_rotation, :local_scale

    def initialize(transform_data)
      # original data
      @data = transform_data
      # processed values
      @local_position = get_local_position
      @local_rotation = get_local_rotation
      @local_scale    = get_local_scale
    end

    private
    def get_local_position
      SFE::Position.new(fetch_transform_coords('localPosition'))
    end

    def get_local_rotation
      SFE::Rotation.new(fetch_transform_coords('localRotation'))
    end

    def get_local_scale
      SFE::Position.new(fetch_transform_coords('localScale'))
    end

    def fetch_transform_coords(type)
      fetch type, :from => data, :default => {}
    end

  end

end