class ExplorerController < ApplicationController
  helper_method :nodes, :position

  def node
    @welcome = "Welcome to the Stranded Deep Node Explorer."
    @prompt  = "Upload your Save.json file"
    @save_file = SFE::Parser.parse
  end

  def save_file
    @save_file
  end

  # TODO: nullsafe
  def terrain
    SFE::Terrain.new(save_file.fetch("TerrainGeneration"))
  end

  # TODO: nullsafe
  def nodes
    terrain.nodes
  end

  # TODO: nullsafe
  def player_movement
    @player_movement ||= persistent.fetch("PlayerMovement")
  end

  # TODO: nullsafe
  def follow_spawn
    @follow_spawn ||= persistent.fetch("FollowSpawn")
  end

  # TODO: nullsafe
  def player_crafting
    @player_crafting ||= persistent.fetch("PlayerCrafting")
  end

  # TODO: nullsafe
  def player_inventory
    @player_inventory ||= persistent.fetch("PlayerInventory")
  end

  # TODO: nullsafe
  def player_statistics
    @player_statistics ||= persistent.fetch("PlayerStatistics")
  end

  # TODO: nullsafe
  def atmosphere
    @atmosphere ||= persistent.fetch("Atmosphere")
  end

  # TODO: nullsafe
  def stats_manager
    @stats_manager ||= persistent.fetch("StatsManager")
  end

end