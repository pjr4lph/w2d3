class Hand
VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
attr_accessor :cards

  def initialize
    @cards = []
  end

  def find_combination
    return find_straight if find_straight
    return find_three_of_a_kind if find_straight
    return find_two_pairs if find_two_pairs
    return find_pair if find_pair
  end

  def card_values
    values = []
    @cards.each do |card|
      values << card.value
    end
    values
  end

  def cart_suits
    suits = []
    @cards.each do |card|
      suits << card.suits
    end
    suits
  end

  def find_pair
    VALUES.each do |val|
      if card_values.count(val) == 2
        combination = @cards.select { |card| card.value == val }
        #Return points instead or something
        return ['pair', combination]
      end
    end
    nil
  end

  def find_two_pairs

  end

  def find_three_of_a_kind

  end

  def find_straight

  end

end
