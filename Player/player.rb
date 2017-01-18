class Player
  # Every player should have four attributes:
  # gold_coins, health_points, lives, and score.
  attr_accessor :gold_coins, :health_points, :lives, :score

  # lives should start at 5.
  # gold_coins and score should both start at 0.
  # health_points should start at 10.
  def initialize(gold_coins = 0, health_points = 10, lives = 5, score = 0)
    @gold_coins = gold_coins
    @health_points = health_points
    @lives = lives
    @score = score
  end

  # Your class should have an instance method called do_battle
  # that subtracts one from the player's health_points.
  # If health_points reaches zero, subtract one from lives and reset health_points to ten.
  # If you have run out of lives, this method should run another method called restart (see below).
  def do_battle
    @health_points -= 1
    if health_points <= 0
      @lives -= 1
      @health_points = 10
    end

    if @lives <= 0
      restart
    end
  end

  # The restart instance method should set all attributes back to their starting values (5, 0, 0, and 10).
  def restart
    @gold_coins = 0
    @health_points = 10
    @lives = 5
    @score = 0
  end

  # Your class should have an instance method called level_up
  # that increases lives by one.
  def level_up
    @lives += 1
  end

  # Your class should have an instance method called collect_treasure
  # that accepts one number as an argument and adds that amount to gold_coins.
  #  If gold_coins reaches ten, score should increase by one.
  # If score reaches ten then the collect_treasure method should run the level_up method.
  def collect_treasure(numebr)
    @gold_coins += numebr

    if @gold_coins >= 10
      score = @gold_coins / 10
      @gold_coins = @gold_coins % 10
      @score += score
    end

    if @score >= 10
      @score -= 10
      level_up
    end
  end
end

fred = Player.new

fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle

p "do battle 9 times"
p fred.health_points #1
p fred.lives #5

fred.do_battle
p "do battle 10 times"
p fred.health_points #10
p fred.lives #4

fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
p "do battle 20 times"
p fred.health_points #10
p fred.lives #3

fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
p "do battle 30 times"
p fred.health_points #10
p fred.lives #2

fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
p "do battle 40 times"
p fred.health_points #10
p fred.lives #1

fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
fred.do_battle
p "do battle 49 times"
p "Health points: #{fred.health_points}" #1
p "Lives: #{fred.lives}" #1
p "Health points: #{fred.health_points}"

fred.do_battle
p "do battle 50 times"
p fred.health_points #10
p fred.lives #5

p "After leveling up"
fred.level_up
p fred.lives #6

p fred.gold_coins #0
p fred.score #0
p fred.lives #6
p "After collecting treasure"
fred.collect_treasure(103)
#fred.collect_treasure(6)
p fred.gold_coins #3
p fred.score  #0
p fred.lives #7
