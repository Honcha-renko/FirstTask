# frozen_string_literal: true
require 'card/card'
require 'cardHolders/board/board'
require 'cardHolders/player/player'

class Game
  def create_deck
    @@deck = []
    [2..14].each do |value| # values
      %w[H D C S].each { |suit| @@deck << Card.new(suit, value) } # suits
    end
  end

  def give_cards(_)
    @@player1 = Player.new(@@deck.delete(sample(2)))
    @@board = Board.new(@@deck.delete(sample(5)))
  end
  @@combination_cards = [][]
  def find_combination()
    def pair
      if (@@combination_cards.all?{|elem|.length == 2 } == 2)
        print'pair'
      end
    end
    def two_pair

    end
    def three_of_kind

    end
    def straight

    end
    def flush

    end

    def full_house

    end
    def four_of_a_kind

    end
    def straight_flush

    end
    def royal_flush

    end
  end

def find_same_value
  @all_cards = @@player1.received_cards +  @@board.received_cards
  @all_cards.each.with_index { |card, i | card }

  #do |card|
    if (@all_cards)
    end
  end

end
  def find_same_suit

  end
  def find_sequence

  end

  def return_result
    return pair
    return two_pair
    return three_of_kind
    return straight
    return flush
    return full_house
    return four_of_a_kind
    return straight_flush
    return royal_flush
  end

end