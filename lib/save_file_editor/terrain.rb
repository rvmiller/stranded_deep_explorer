module SFE

  class Terrain < AbstractObject
    attr_reader :player_pos, :world_seed, :world_origin, :nodes

    def initialize(terrain_generation_data)
      @player_pos   = get_player_position(terrain_generation_data)
      @world_seed   = get_world_seed(terrain_generation_data)
      @world_origin = get_world_origin(terrain_generation_data)
      @nodes        = get_nodes(terrain_generation_data)
    end

    private
    def get_player_position(tgd)
      fetch 'playerPosition', :from => tgd, :default => {"x"=>"?", "y"=>"?", "z"=>"?"}
    end

    def get_world_seed(tgd)
      fetch 'playerPosition', :from => tgd, :default => {"x"=>"?", "y"=>"?", "z"=>"?"}
    end

    def get_world_origin(tgd)

    end

    def get_nodes(tgd)
      nodes = Array.new

      parse_nodes(tgd).each do |node_key, node_data|
        nodes << SFE::Node.new(node_data)
      end

      nodes
    end

    def parse_nodes(tgd)
      fetch 'Nodes', :from => tgd, :default => {}
    end

  end

end
