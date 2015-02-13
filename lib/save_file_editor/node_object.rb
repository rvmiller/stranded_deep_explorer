module SFE
  class NodeObject < AbstractObject
    attr_reader :id, :name, :reference, :prefab, :game_object, :transform, :containers_generated

    def initialize(id, object_data)
      @id          = id
      @name        = get_name(object_data)
      @reference   = get_reference(object_data)
      @prefab      = get_prefab(object_data)
      @game_object = get_game_object(object_data)
      @transform   = get_transform(object_data)
      @containers_generated = get_containers_generated(object_data)
    end

    def containers_generated?
      containers_generated
    end

    private
    def get_name(object_data)
      fetch "name", :from => object_data, :default => 'unknown'
    end

    def get_reference(object_data)
      fetch "reference", :from => object_data, :default => 'none'
    end

    def get_prefab(object_data)
      fetch "prefab", :from => object_data, :default => 'none'
    end

    def get_game_object(object_data)
      fetch "GameObject", :from => object_data, :default => {}
    end

    def get_transform(object_data)
      SFE::Transform.new(get_transform_data(object_data))
    end

    def get_transform_data(object_data)
      fetch "Transform", :from => object_data, :default => {}
    end

    def get_containers_generated(object_data)
      fetch "containersGenerated", :from => object_data, :default => nil
    end

  end
end