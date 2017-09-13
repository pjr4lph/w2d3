require 'poker'
require 'rspec'

describe Card do
  subject(:card) { Card.new("A", :s) }
  describe '#initialize' do
    it 'will hold a value' do
      expect(card.value).to eq("A")
    end
    it 'will hold a suit' do
      expect(card.suit).to eq(:s)
    end
  end
end

describe Deck do
  subject(:deck) { Deck.new }

  suits = [:c, :d, :h, :s]
  values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'j', 'q', 'k', 'a']
  cards = values.product(suits)

  describe '#initialize' do

    it 'has a full deck' do
      expect(deck.cards.length).to eq(52)
    end

    it 'sets the deck' do
      expect(deck.cards).to eq(cards)
    end
  end

end

describe Hand do
  subject(:hand) { Hand.new }
  describe '#initialize' do
    it 'starts empty' do
      expect(hand.cards).to be_empty
    end
  end

  describe '#find_combination' do
    it 'finds a pair' do
      hand.cards = [Card.new("A", :c),
        Card.new("Q", :h),
        Card.new("Q", :s),
        Card.new("J", :h),
        Card.new(7, :d)]

      expect(hand.find_combination).to eq(['pair', [["Q", :h],["Q", :s]]])
    end

    it 'compares one hand to another'

    it 'finds two pairs'

    it 'finds three of a kind'

    it 'finds a straight'

  end
end

  describe Player do
    subject(:player) { Player.new(20) }
    describe '#initialize' do
      it 'starts with an empty hand' do
        expect(player.hand.class).to eq(Hand)
      end

      it 'starts with a pot' do
        expect(player.pot).to eq(20)
      end
    end
  end
