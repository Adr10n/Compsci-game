require './scenes.rb'

class Engine

  def initialize(scene_map)
    @scene_map = scene_map
  end

  def play()
    current_scene = @scene_map.opening_scene()
    last_scene = @scene_map.next_scene('finished')

    while current_scene != last_scene
      next_scene_name = current_scene.enter()
      current_scene = @scene_map.next_scene(next_scene_name)
    end

    # be sure to print out the last scene
    current_scene.enter()
  end
end

class Map
  @@scenes = {
    'Scorpion' => Scorpion.new(),
    'Polarbear' => Polarbear.new(),
    'TheWaterfall' => TheWaterfall.new(),
    'Raft' => Raft.new(),
    'death' => Tiger.new(),
    'finished' => Finished.new()
  }


  def initialize(start_scene)
    @start_scene = start_scene
  end


  def next_scene(scene_name)
    val = @@scenes[scene_name]
    return val
  end

  def opening_scene()
    return next_scene(@start_scene)
  end
end


a_map = Map.new('Scorpion')
a_game = Engine.new(a_map)
a_game.play()
