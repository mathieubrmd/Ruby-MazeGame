=begin
action.rb - Define the different types of actions - Paper/Rock/Scissors
Mathieu Bourmaud - 19941124-P335
Martin Porrès - 19940926-P170
=end

class ActionFactory
  def createAction(name)
    if (name == "rock")
        return Rock.new()
    end

    if (name == "paper")
        return Paper.new()
    end

    if (name == "scissors")
        return Scissors.new()
    end
  end

  def getRandomAction()
    val = rand(0..2)

    if (val == 0)
      return Rock.new()
    end

    if (val == 1)
      return Paper.new()
    end

    if (val == 2)
      return Scissors.new()
    end
  end
end

class Action
  attr_accessor :name

  def initialize()
    @name = ''
  end
end

class Rock < Action
  def initialize()
    @name = 'rock'
  end

  def attack(action)
    return action.got_attacked_by_rock(self)
  end

  def got_attacked_by_paper(action)
    puts("You chose " + action.name + ", your opponent chose rock. You win!")
    return true
  end

  def got_attacked_by_rock(action)
    puts("You chose " + action.name + ", your opponent chose rock. It's a tie!")
    return nil
  end

  def got_attacked_by_scissors(action)
    puts("You chose " + action.name + ", your opponent chose rock. Your opponent wins!")
    return false
  end
end

class Paper < Action
  def initialize()
    @name = 'paper'
  end

  def attack(action)
    return action.got_attacked_by_paper(self)
  end

  def got_attacked_by_paper(action)
    puts("You chose " + action.name + ", your opponent choose paper. It's a tie!")
    return nil
  end

  def got_attacked_by_rock(action)
    puts("You chose " + action.name + ", your opponent choose paper. Your opponent wins!")
    return false
  end

  def got_attacked_by_scissors(action)
    puts("You chose " + action.name + ", your opponent choose paper. You win!")
    return true
  end
end

class Scissors < Action
  def initialize()
    @name = 'scissors'
  end

  def attack(action)
    return action.got_attacked_by_scissors(self)
  end

  def got_attacked_by_paper(action)
    puts("You chose " + action.name + ", your opponent chose scissors. Your opponent wins!")
    return false
  end

  def got_attacked_by_rock(action)
    puts("You chose " + action.name + ", your opponent chose scissors. You win!")
    return true
  end

  def got_attacked_by_scissors(action)
    puts("You chose " + action.name + ", your opponent chose scissors. It's a tie!")
    return nil
  end
end