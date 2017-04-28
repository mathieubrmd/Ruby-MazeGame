=begin
action.rb - Define the different types of actions - Paper/Rock/Scissors
Mathieu Bourmaud - 19941124-P335
Martin Porrès - 19940926-P170
=end

class Action
  def initialize()
    @name = ''
  end
end
    @name = ""

class Rock < Action
  def initialize()
    @name = "Rock"
  end
end

class Paper < Action
  def initialize()
    @name = "Paper"
  end
end

class Scissors < Action
  def initialize()
    @name = 'Scissors'
  end
end