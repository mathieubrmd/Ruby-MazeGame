=begin
action.rb - Define the different types of actions - Paper/Rock/Scissors
Mathieu Bourmaud - 19941124-P335
Martin Porrès - 19940926-P170
=end

require './scanner'
require './actions'

# The main class that runs the game
class Game
  def initialize()
    @player = Player.new()
    @ennemy = Player.new()
    @scanner = Scanner.new()
    @actionFactory = ActionFactory.new()
  end

  # Return true if the player won and false if the ennemy won
  def handleEnnemy()
    puts('You got attacked by an ennemy !')
    puts('In order to beat them, you have to challenge them to play a Rock-Paper-Scissors.')
    puts('Make your attack choice (rock, paper or scissors):')

    res = @scanner.readActionName()

    # If the result is false, it means that the input wasn't correct
    while res == false
      puts('Make a new attack choice between rock, paper or scissors:')
      res = @scanner.readActionName()
    end

    # Creating the actions for the player and the ennemy
    @player.currentAction = @actionFactory.createAction(res)
    @ennemy.currentAction = @actionFactory.getRandomAction()

    # The result of the attack
    attack_result = @player.currentAction.attack(@ennemy.currentAction)

    # While the attack is nil (a tie), we redo the attack with other actions
    while attack_result == nil
      puts('Make a new attack choice between rock, paper or scissors:')
      res = @scanner.readActionName()
      @player.currentAction = @actionFactory.createAction(res)
      @ennemy.currentAction = @actionFactory.getRandomAction()
      attack_result = @player.currentAction.attack(@ennemy.currentAction)
    end

    # We return the result of the attack when it's not a tie
    return attack_result
  end
end

# A simple player class, in the game it'll be either an ennemy or the player of the game
# The currentAction attribute is the Action (Rock, Paper or Scissors) that the user chose
# The currentAction is randomly attributed to an ennemy
class Player
  attr_accessor :currentAction

  def initialize()
    @currentAction = Action.new()
  end
end

# Just a test code to test if the RPS game is working correctly
game = Game.new()
game.handleEnnemy()