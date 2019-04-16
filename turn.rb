require './player'

class Turn
  attr_accessor:current_turn

  def initialize(players)
    @players = players
    @current_turn = 1
    @question_answer = 0
    @current_asker = @players[0]
    @current_answerer = @players[1]
  end

  def question
    first_num = rand(0-20)
    second_num = rand(0-20)
    @question_answer = first_num + second_num
    puts "#{@current_asker.name} : what is #{first_num} plus #{second_num}?"
    user_answer = gets.chomp.to_i
    correct?(user_answer)
  end

  def correct?(answer)
    if answer == @question_answer
      puts "Yes, you got it right"
      puts "===  Game Status ==="
      puts "#{@current_asker.summary} vs #{@current_answerer.summary}"
      toggle_turn
      new_round
    else
      puts "#{@current_asker.name}: Revisit grade school please, you got it wrong"
      @current_answerer.lose_health
      puts "===  Game Status ==="
      puts "#{@current_asker.summary} vs #{@current_answerer.summary}"
      toggle_turn
      new_round
    end
  end

  def toggle_turn
    @current_asker = (@current_asker == @players[0]) ? @players[1] : @players[0]
    @current_answerer = (@current_answerer == @players[0]) ? @players[1] : @players[0]
  end

  def new_round
    @current_turn += 1
  end
end