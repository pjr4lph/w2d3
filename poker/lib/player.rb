class Player

  attr_accessor :hand, :pot 

  def initialize(pot)
    @hand = Hand.new
    @pot = pot
  end
end
