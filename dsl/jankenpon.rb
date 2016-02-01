# Lab 8: Domain-Specific Language Pattern
# Date: 21-Mar-2012
# Author:
# Marco Chávez

$h = nil
$action = nil

class Weapon
  
  @winner = nil
  @loser = nil
  
  def self.+(other)
    
    if self == other || $h[self][0] == other || $h[self][1] == other
      @winner = self
      @loser = other
    else
      @winner = other
      @loser = self
    end
    
    if @winner == @loser
      print "#{ @winner } tie (winner #{ @winner })\n"
    else
      action = $action[@winner][@loser]
      print "#{ @winner } #{ action } #{ @loser } (winner #{ @winner })\n"
    end
    @winner
  end
  
  def self.-(other)
    if $h[self][0] == other || $h[self][1] == other
      @winner = self
      @loser = other
    else
      @winner = other
      @loser = self
    end
    
    if @winner == @loser
      print "#{ @winner } tie (loser #{ @loser })\n"
    else
      action = $action[@winner][@loser]
      print "#{ @winner } #{ action } #{ @loser } (loser #{ @loser })\n"
    end
    @loser
  end
  
end

class Rock < Weapon
end

class Paper < Weapon
end

class Scissors < Weapon
end

class Lizard < Weapon
end

class Spock < Weapon
end

def show(data)
  if $h[data]
    print "Result = #{ data }\n"
  else
    print data
  end
end

$h = {
  Rock => [Lizard, Scissors],
  Paper => [Spock, Rock],
  Scissors => [Paper, Lizard],
  Spock => [Scissors, Rock],
  Lizard => [Paper, Spock]}

$action = {
  Rock => {Lizard => 'crushes', Scissors => 'crushes'},
  Paper => {Spock => 'disproves', Rock => 'covers'},
  Scissors => {Paper => 'cut', Lizard => 'decapitate'},
  Spock => {Scissors => 'smashes', Rock => 'vaporizes'},
  Lizard => {Paper => 'eats', Spock => 'poisons'}}
