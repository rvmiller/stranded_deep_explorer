class ExplorerController < ApplicationController
  helper_method :nodes, :position

  def node
    @welcome = "Terrain Node Explorer."
    @prompt  = "Upload your Save.json file"
    @save_file = SFE::SaveFile.new
  end

  def save_file
    @save_file
  end

  def data
    save_file.data
  end

  def terrain_generation
    return {} if data.empty?
    data.fetch("TerrainGeneration")
  end

  #def save_file
  #  if params[:upload]
  #    return SFE::Parser.parse(params[:upload])
  #  else
  #    return SFE::Parser.parse(:sample)
  #  end
  #end

  def upload
    @save_file = SFE::SaveFile.new
    save_file.file = params[:file]
    flash[:notice] = "File uploaded"
    #redirect_to "/explorer/node"
  end

  # TODO: nullsafe
  def terrain
    SFE::Terrain.new(terrain_generation)
  end

  # TODO: nullsafe
  def nodes
    terrain.nodes
  end

  # TODO: nullsafe
  def player_movement
    @player_movement ||= data.fetch("PlayerMovement")
  end

  # TODO: nullsafe
  def follow_spawn
    @follow_spawn ||= data.fetch("FollowSpawn")
  end

  # TODO: nullsafe
  def player_crafting
    @player_crafting ||= data.fetch("PlayerCrafting")
  end

  # TODO: nullsafe
  def player_inventory
    @player_inventory ||= data.fetch("PlayerInventory")
  end

  # TODO: nullsafe
  def player_statistics
    @player_statistics ||= data.fetch("PlayerStatistics")
  end

  # TODO: nullsafe
  def atmosphere
    @atmosphere ||= data.fetch("Atmosphere")
  end

  # TODO: nullsafe
  def stats_manager
    @stats_manager ||= data.fetch("StatsManager")
  end

end