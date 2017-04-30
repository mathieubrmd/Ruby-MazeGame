=begin
action.rb - Define the different types of actions - Paper/Rock/Scissors
Mathieu Bourmaud - 19941124-P335
Martin Porrès - 19940926-P170
=end

require './maze_factory'
require './scanner'

# The main class that runs the game
class Game
  def initialize(maze)
    @pos_x = 0
    @pos_y = 0
    @maze = maze
    @finished = false
    @scanner = Scanner.new()
  end

  def play
    while !@finished
      room = @maze.get_room(@pos_x, @pos_y)
      describe_room(room)

    end
    puts('Congratulations, you find the treasure room !')
  end

  def describe_room(room)
    puts('You enter a room.')
    if room.get_content.is_a?(Treasure)
      puts('Congratulations, you find the treasure room !')
      @finished = true
    end
    #room
    if room.get_content.is_a?(Monster)
      puts('There is a horrible monster with large teeth in a corner.')
      puts('What do you want to do (L, F):')
      res = @scanner.readMonsterAction()
      if res == 'F'
        room.get_content.play
      end
    else
      puts('There are no enemies.')
      puts('What do you want to do (L):')
      res = @scanner.readNoMonsterAction()
    end
  end

  def handle_monster(room)

  end

end
