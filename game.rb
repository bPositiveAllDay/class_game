require './player'
require 'colorize'

@players = []

  def create_players(number_of_players)
    (1..number_of_players).each do |playerNum|
      puts "Player #{playerNum}, what's your name?".colorize(:light_blue)
      player = gets.chomp.capitalize!
      @players << Player.new(player)

    end
  end

  def intro
    puts "Welcome to Grade School Math Trivia!!!".colorize(:blue)
    puts "How many players will this game have?"
  end
     

  def question
    @num1 = rand(1..20)
    @num2 = rand(1..20)

    operators = [:+, :-, :*]
    @op = operators.sample

    @result = @num1.send(@op, @num2)
  end


  def ask(player)
    print "#{player.name}, what is #{@num1} #{@op} #{@num2}? "
    @answer = gets.chomp.to_i
  end


def compare(player)
  
  if @answer == @result
    puts "-------------------------------------------------"
    puts "You are correct!".colorize(:green)
    player.points += 1      
  else 
    puts "-------------------------------------------------"
    puts "You are wrong!".colorize(:red)
    player.lives -= 1
  end
end
  

  def game_over
    puts "Sorry.... #{@curr.name}... You're a loser!".colorize(:yellow).on_red.underline
  end

  def nobody_dead?
    @players.each do |player|
      return false if (player.lives <= 0 )
    end
    return true
  end


intro
create_players(gets.chomp.to_i)

while nobody_dead? 

  @players.each  do |player|
  @curr = player
  question
  ask(player)
  compare(player)
  puts "#{@curr.name } has #{player.lives} lives and #{player.points} points "
  puts "-------------------------------------------------"
  end
end
game_over

