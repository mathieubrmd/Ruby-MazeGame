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
end