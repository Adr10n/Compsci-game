class Scene
    
  def enter()
    puts "This scene is not yet configured. Subclass it and implement enter()."
    exit(1)
  end
  
end

class Detention < Scene
    
  @@quips = [
    "You've been sent to Mr. Beynolds office with a detention. Don't worry, they
        don't actually do anything to you - it's just a formality.",
     "Just wait until you're parents find out you got a detention. Tsk tsk.",
     "Uh oh, guess you gotta spend 5 mins cleaning the chemistry lab now! ¯\_(ツ)_/¯"
  ]

  def enter()
    puts @@quips[rand(0..(@@quips.length - 1))]
    exit(1)
  end
end

class English < Scene

  def enter()
    puts "Your name is Myles Robinson. You are a 16-year-old African-American male who attends"
    puts "The Browning School on New York City's Upper East Side. It's first period and you"
    puts "have English. You're wearing a Thrasher hoodie and a pair of Nike Prestos (customized" 
    puts "by $cumbag $ean). Mr. Pingrisani Ye walks in the room and you already know it's about"
    puts "to be on scene.\n\n"
    puts "'Mr. Robinson,' Pingrisani says.\n\n"
    puts "'Oh here we go...', you mumble.\n\n"
    puts "'Was there a change in the dress code that I'm not aware of? I can't seem think of any"
    puts "other reason why you'd be out of uniform.'\n\n"
    puts "What is your response?\n"
    puts "1. Boi, it is 8:30 in the morning. I'm really not tryna do this now.\n"
    puts "2. Not all of us wear the same dusty jacket and tie everyday.\n"
    puts "3. Sorry about that. It won't happen again.\n"
    print "> "

    action = $stdin.gets.chomp

    if action == "1"
      puts ""
      return 'detention'

    elsif action == "2"
      puts ""
      return 'detention'

    elsif action == "3"
      puts ""
      return 'advisory'

    else
      puts "DOES NOT COMPUTE!"
      return 'english'
    end
  end
end

class Advisory < Scene

  def enter()
    puts "'Hello, my precious angels,' says the unmistakable voice of Ms. Bryan."
    puts "As she walks in the room, her eyes lock on you. You nod at her and force"
    puts "a smile.\n"
    puts "'Good morning, Ms. Bryan,' you tell her.\n"
    puts "'Myles...do you want to tell me why you're out of dress code?' she asks.\n\n"
    puts "What is your response?\n"
    puts "1. Not really, no.\n"
    puts "2. I woke up late and I couldn't find my blazer.\n"
    print "> "

    action = $stdin.gets.chomp

    if action == "1"
      puts ""
      return 'detention'

    elsif action == "2"
      return 'precalc'
    else
      puts "DOES NOT COMPUTE!"
      return "advisory"
    end
  end
end

class Precalc < Scene

  def enter()
    puts "Your next class is Pre-Calculus with Ms. Razka. As you step into"
    puts "room 202 you are welcomed with a certain musk unlike any other room"
    puts "in the school. You wonder if there's a decomposing body hiding in the"
    puts "closet. As you take your seat in the back of the room, Ms. Razka walks"
    puts "through the door and makes her way to the desk. As she sits down, you"
    puts "both lock eyes. Her eyes widen and a smile begins to stretch across her"
    puts "face.\n\n"
    puts "'Myles,' she tells you. 'Are we really going to have to do this again?'\n\n"
    puts "'I don't know, are we?' you reply.\n\n"
    puts "'I'll tell you what,' she says. 'If you can tell me what the answer to the"
    puts "square root of 1888, rounded to the nearest hundredth, then I'll let you off"
    puts "this one time.'"
    code = "43.45"
    print "> "
    guess = $stdin.gets.chomp
    guesses = 0

    while guess != code && guesses < 10
      puts "BZZZZEDDD!"
      guesses += 1
      print "> "
      guess = $stdin.gets.chomp
    end

    if guess == code
        puts ""
        return 'hallway'
    else
        puts ""
        return 'detention'
    end
  end
end

class Hallway < Scene

  def enter()
    puts "You finally have a free period where you can just relax and not have"
    puts "to worry about teachers. You walk down towards the locker room, since"
    puts "the school doesn't have a senior lounge. Right as you turn the door handle"
    puts "you hear someone clear their throat behind you. You turn around and see"
    puts "Mr. Clean standing in front of you smiling and nodding his head.\n\n"
    puts "'Dude,' he tells you. 'Why aren't you getting the message? Wear your blazer man!'"
    puts "'I'll tell you what. I'm thinking of a number between one and five. If you guess it"
    puts "right, I'll let you off. If you don't, I'm giving you a detention. So?'"

    good_pod = rand(1..5)
    print "> "
    guess = $stdin.gets.chomp.to_i

    if guess != good_pod
      return 'detention'
    else
      puts "'I'll let you off this time, but don't let me catch you without a blazer again.'\n\n"
      puts "You exhale and finally open the door to the locker room. You toss your bag to the side"
      puts "and sit down on the bench to relax."
      return 'finished'
    end
  end
end

class Finished < Scene
  def enter()
    puts "Congratulations. You've made it through three periods out of dress code."
  end
end