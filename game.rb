# frozen_string_literal: true
require 'card'
require 'board'
require 'player'

class Game

  def initialize
    #@combination_cards
    @deck=create_deck
    # give cards
    @player = Player.new(@deck.delete(sample(@player.required_card_number)))
    @board = Board.new(@deck.delete(sample(@board.required_card_number)))
  end

  def create_deck
    [2..14].each do |value|
      #deck without declaration it`s ok?
      %w[H D C S].each { |suit| @deck.append(Card.new(suit, value))  }
    end
  end

  def give_cards
    @board.received_cards = @deck.delete(sample(5))
  end

    def pair
      if (@combination_cards.all?{|elem|.length == 2 } == 2)
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

def find_same_value
  @all_cards = @player1.received_cards +  @board.received_cards
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
    return royal_flush
    return straight_flush
    return four_of_a_kind
    return full_house
    return flush
    return straight
    return three_of_kind
    return two_pair
    return pair
  end

