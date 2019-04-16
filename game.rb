require './player'
require './turn'

class Game
  def initialize
    puts "Choose your name"
    player1 = Player.new(gets.chomp)
    puts "Choose your enemy's name"
    player2 = Player.new(gets.chomp)     
    @players=[player1,player2]
  end

  def run
    turn = Turn.new(@players)
    while (not game_over?)
      pad " Round #{turn.current_turn}"
      turn.question
    end

  end

  def alive_players
    @players.select {|p| p.alive?}
  end

  def pad(message)
    puts
    puts "===== #{message} ====="
    puts
  end

  def game_over? 
    alive_players.length == 1
  end
  
end