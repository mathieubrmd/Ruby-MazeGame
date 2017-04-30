=begin
action.rb - Define the different types of actions - Paper/Rock/Scissors
Mathieu Bourmaud - 19941124-P335
Martin Porrès - 19940926-P170
=end

# A simple class that reads the user inputs
class Scanner

  # Read the action name that the user types when he meets an ennemy
  # It can be either rock, scissors or paper
  # Return false if the input isn't correct
  # Return the action name (string) if the input is correct
  def readActionName()
    action = gets.chomp()

    if action != "scissors" and action != "rock" and action != "paper"
      puts("The action that you choose should be rock, scissors or paper.")
      return false
    end

    return action
  end

  def readMonsterAction()
    action = gets.chomp()
    if action != "L" and action != "F"
      puts("The action that you choose should be L or F.")
      return nil
    end
    return action
  end

  def readNoMonsterAction()
    action = gets.chomp()
    if action != "L"
      puts("The action that you choose should be L")
      return nil
    end
    return action
  end

  def readLeavingOri()
    action = gets.chomp()
    if action != "N" and action != "S" and action !="E" and action != "W"
      puts("The action that you choose should be N, S, E or W")
      return nil
    end
    return action
  end
end