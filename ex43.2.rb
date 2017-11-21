class Scene
  def enter()
    puts "This scene is not yet configured. Subclass it and implement enter()."
    exit(1)
  end
end

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

class Tiger < Scene

  @@quips = [
    "You have walked into the deep Irvine Jungle, sudenly you have encountered a tiger, he maims you."
  ]

  def enter()
    puts @@quips[rand(0..(@@quips.length - 1))]
    exit(1)
  end
end

class Scorpion < Scene

  def enter()
    puts "You walk bleeding and struggling and then you stumble upon a scorpion, he makes
    a move to sting you."
    print "> "

    action = $stdin.gets.chomp

    if action == "shoot!"
      puts "Quick on the draw you yank out your blaster and fire it at the Scorpion."
      puts "you are dead.  Then he eats you."
      return 'death'

    elsif action == "dodge!"
      puts " He expected this"
      puts " he stings your head and eats you."
      return 'death'

    elsif action == "run"
      puts "lucky for you he has stubby legs."
      puts "he died of asthma"
      return 'good job'

class Polarbear < Scene

  def enter()
    puts "there is a polar bear in the jungle, so trust me it is angry."
    puts "but he is a robotic bear with a bomb, in order to escape you must diffuse the bomb with" 
    puts "a special code"
    puts "get the bomb.  The code is 3 digits."
    code = "#{rand(1..9)}#{rand(1..9)}#{rand(1..9)}"
    print "[keypad]> "
    puts " The code is " + code
    guess = $stdin.gets.chomp
    guesses = 0

    while guess != code && guesses < 10
      puts "BZZZZEDDD!"
      guesses += 1
      print "[keypad]> "
      guess = $stdin.gets.chomp
    end

    if guess == code
        puts "The Polar Bear dies."
        return 'the_Waterfall'
    else
        puts "The lock buzzes one last time and then you hear a sickening"
        puts "melting sound as the mechanism is fused together."
        puts "You decide to sit there, and finally the snakes blow up the"
        puts "boat from their ship and you die."
        return 'death'
    end
  end
end


class TheWaterfall < Scene

  def enter()
    puts "You burst onto the bridge with the netron destruct bomb"
    puts "under your arm and surprise 5 rabid wolfs who are trying to"
    puts "take ravage the ship. The each have a gun"
    puts "and want to shoot your brains off."
    print "> "

    action = $stdin.gets.chomp

    if action == "throw the bomb"
      puts "In a panic you throw the bomb at the group of wolfs"
      puts "and make a leap for the door.  Right as you drop it a"
      puts "wolf shoots you right in the back killing you."
      puts "As you die you see another wolf frantically try to disarm"
      puts "the bomb. As you die you hear the bomnb."
      return 'death'

    elsif action == "Give them some food"
      puts "You run down the ship and throw the remaining portion of your food to them"
      puts "They begin to kill themselves fighting over the meat"
      
      return 'Raft_down_the_river'
    else
      puts "DOES NOT COMPUTE!"
      return "the_waterfall"
    end
  end
end


class Raft_down_the_river < Scene

  def enter()
    puts "You rush through the ship desperately trying to make it to"
    puts "the the raft to escape down the river before the whole ship explodes."  
    puts "You get to the chamber with the rafts, and"
    puts "now need to pick one to take.  Some of them could be damaged"
    puts "but you don't have time to look.  There's 5 raftys, which one"
    puts "do you take?"

    good_pod = rand(1..5)
    print "[pod #]> "
    guess = $stdin.gets.chomp.to_i

    if guess != good_pod
      puts "You jump into raft%s and it has a leak." % guess
      puts "The raft escapes out into the river , then"
      puts "implodes as the hull ruptures, crushing your body"
      puts "into goop and max motz eats your slime."
      return 'death'
    
    else
      puts "You jump into the raft%s and hit the eject button." % guess
      puts "The raft easily slides out into the river and heads out to"
      puts "the river and you jump to the tree righ on time.You look"
      puts "back and see your ship implode then explode. You won!"


      return 'finished'
    end
  end
end

class Finished < Scene
  def enter()
    puts "You won! Good job."
  end
end

class Map
  @@scenes = {
    'Tiger' => Tiger.new()
    'Scorpion' => Scorpion.new(), 
    'Polarbear' => Polarbear.new(),
    'TheWaterfall' => TheWaterfall.new(),
    'Raft_down_the_river' => Raft_down_the_river.new(),
    'death' => Death.new(),
    'finished' => Finished.new(),
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


a_map = Map.new('central_corridor') 
a_game = Engine.new(a_map)
a_game.play()