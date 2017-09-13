class Deck

  attr_accessor :cards

  def initialize
    @cards = populate_cards
  end

  def populate_cards
    suits = [:c, :d, :h, :s]
    values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'j', 'q', 'k', 'a']

    values.product(suits)
  end
end
