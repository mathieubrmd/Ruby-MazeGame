class MazeFactory
  def maze_game(length, height)
    return Maze.new(length, height)
  end

  def make_room(x, y)
    return Room.new(x, y)
  end

  def make_door(r1, r2)
    return Door.new(r1, r2)
  end

  def make_wall(r1, r2)
    return Wall.new(r1, r2)
  end
end

class Wall
  def initialize(r1, r2)
    @r1, @r2 = r1, r2
  end
end

class Door
  def initialize(r1, r2)
    @r1, @r2 = r1, r2
  end
end

class Room
  def initialize(x, y)
    @x, @y = x, y
  end
end

class Maze
  def initialize(length, height)
    @length, @height = length, height
  end
end

def make_maze(x_size, y_size)
  factory = MazeFactory.new()
  m = factory.maze_game(x_size, y_size)
end

make_maze(20, 20)

