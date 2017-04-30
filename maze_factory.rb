=begin
action.rb - Define the different types of actions - Paper/Rock/Scissors
Mathieu Bourmaud - 19941124-P335
Martin Porrès - 19940926-P170
=end

require './rps-game'

class MazeFactory
  def maze_game(length, height)
    return Maze.new(length, height)
  end

  def make_room
    return Room.new
  end

  def make_door(room)
    return Door.new(room)
  end

  def make_wall
    return Wall.new()
  end
end

class Monster
  @challenge = RPS_game.new() #this is the RPS game

  def play
    @challenge.play
  end
end

class Treasure
end

class Wall
end

class Door
  def initialize(room)
    # @room is the room that the door leads to
    @room = room
  end

  def get_new_room
    return @room
  end
end

class Room
  def initialize()
    @orientation = {'N' => Wall.new, 'S' => Wall.new, 'E' => Wall.new, 'W' => Wall.new}
    @content = nil
  end

  # set the element (type = w or d) on the wall (o1 = N, S, E, W)
  def set_elem(type, o1='n')
    @orientation[o1] = type
  end

  # get the element (return = Wall or Door) on the wall (o1 = N, S, E, W)
  def get_elem(o1)
    return @orientation[o1]
  end

  def set_content(type)
    @content = type
  end

  def get_content()
    return @content
  end

end

class Maze
  def initialize(length, height)
    @length, @height = length, height
    @map = Array.new(length){Array.new(height, Room.new)}
  end

  def set_room(room, x, y)
    @map[x][y] = room
  end

  def get_room(x, y)
    return @map[x][y]
  end

  def get_length
    return @length
  end

  def get_height
    return @height
  end
end

def make_maze(x_size, y_size)
  factory = MazeFactory.new()
  @m = factory.maze_game(x_size, y_size)
  for x in 0..x_size-1
    for y in 0..y_size-1
      #creating a door to a random room
      rand_x = rand(x_size)
      rand_y = rand( y_size)
      room = @m.get_room(x, y)
      #DEBUG
      puts("BEFORE SET")
      debug(room, x, y)
      #DEBUG
      rand_room = @m.get_room(rand_x, rand_y)
      ori = ['N', 'S', 'E', 'W'].sample()
      op_ori = get_opposed_orientation(ori)
      #create an enemy (1 chance out of 10)
      if rand(10).zero?
        room.set_content(Monster.new)
      end
      #check if rooms already have a door
      if !room.get_elem(ori).is_a?(Door) && !rand_room.get_elem(op_ori).is_a?(Door)
        door = factory.make_door(rand_room)
        door2 = factory.make_door(room)
        room.set_elem(door, ori)
        rand_room.set_elem(door2, op_ori)
        @m.set_room(room, x, y)
        @m.set_room(rand_room, rand_x, rand_y)

        #DEBUG
        puts("AFTER SET")
        room = @m.get_room(x, y)
        debug(room, x, y)
        #DEBUG

      end
    end
  end
  #set treasure room
  rand_x = rand(x_size)
  rand_y = rand( y_size)
  room = @m.get_room(rand_x, rand_y)
  room.set_content(Treasure.new())
  @m.set_room(room, rand_x, rand_y)

  return @m
end

def get_opposed_orientation(orientation)
  case orientation
    when 'N'
      return 'S'
    when 'S'
      return 'N'
    when 'E'
      return 'W'
    when 'W'
      return 'E'
  end
  return 'N'
end

def debug(room, x, y)
  str = 'VIRGIN X: '
  str += x.to_s
  str += ' Y: '
  str += y.to_s
  str += ' DOOR:'
  if room.get_elem('N').is_a?(Door)
    str += ' N'
  end
  if room.get_elem('S').is_a?(Door)
    str +=' S'
  end
  if room.get_elem('E').is_a?(Door)
    str += ' E'
  end
  if room.get_elem('W').is_a?(Door)
    str += ' W'
  end
  puts(str)
end