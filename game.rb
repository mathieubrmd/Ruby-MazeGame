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
    @run = true
    @scanner = Scanner.new()
  end

  def play
    room = @maze.get_room(@pos_x, @pos_y)
    while @run
      describe_room(room)
      puts('You wan to leave. Trough which door (N, S, E, W):')
      res = nil
      while res == nil
        res = @scanner.readLeavingOri()
        if room.get_elem(res).is_a?(Door)
          room = room.get_elem(res).get_new_room()
        end
      end
    end
    puts('Congratulations, you find the treasure room !')
  end

  def describe_room(room)
    puts('You enter a room.')
    # check treasure room
    if room.get_content.is_a?(Treasure)
      puts('Congratulations, you find the treasure room !')
      @run = false
      return
    end
    check_doors(room)
    check_monster(room)
  end

  def check_doors(room)
    str = 'There are doors to the'
    if !room.get_elem('N').is_a?(Door)
      str += ' north,'
    end
    if !room.get_elem('S').is_a?(Door)
      str +=' south,'
    end
    if !room.get_elem('E').is_a?(Door)
      str += ' east,'
    end
    if !room.get_elem('W').is_a?(Door)
      str += ' west,'
    end
    str = [0...-1]
    str += '.'
    puts(str)
  end

  def check_monster(room)
    if room.get_content.is_a?(Monster)
      puts('There is a horrible monster with large teeth in a corner.')
      res = nil
      while res == nil
        puts('What do you want to do (L, F):')
        res = @scanner.readMonsterAction()
        if res == 'F'
          room.get_content.play
        end
      end
    else
      puts('There are no enemies.')
      res = nil
      while res == nil
        puts('What do you want to do (L):')
        res = @scanner.readNoMonsterAction()
      end
    end
  end
end