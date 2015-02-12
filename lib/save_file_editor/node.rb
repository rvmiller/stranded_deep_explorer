module SFE
  class Node < AbstractObject
    attr_reader :name, :biome, :position, :fully_generated, :objects

    def initialize(node_data)
      parse(node_data)
    end

    def fully_generated?
      @fully_generated
    end

    private
    def parse(node_data)
      @name     = get_name(node_data)
      @biome    = get_biome(node_data)
      @position = get_position(node_data)
      @fully_generated = get_fully_generated(node_data)
      @objects  = get_objects(node_data)
    end

    def get_name(node_data)
      fetch "name", :from => node_data, :default => missing_string
    end

    def get_biome(node_data)
      fetch "biome", :from => node_data, :default => missing_string
    end

    def get_position(node_data)
      SFE::Position.new(get_coords(node_data))
    end

    def get_coords(node_data)
      fetch "position", :from => node_data, :default => {}
    end

    def get_fully_generated(node_data)
      fetch "fullyGenerated", :from => node_data, :default => false
    end

    def get_objects(node_data)
      object_array = Array.new
      id = 0
      get_object_data(node_data).each do |object_key, object_data|
        object_array << SFE::NodeObject.new(id, object_data)
        id += 1
      end
      object_array
    end

    def get_object_data(node_data)
      fetch "Objects", :from => node_data, :default => {}
    end

  end
end