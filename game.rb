# frozen_string_literal: true
require_relative 'card'
require_relative 'board'
require_relative 'player'

class Game
  attr_reader :player
  attr_reader :board
  def initialize
    #@combination_cards
    @deck = create_deck
    # give cards to player and put cards on the table
    @player = Player.new(give_cards(Player::REQUIRED_CARDS_NUMBER))
    @board = Board.new(give_cards(Board::REQUIRED_CARDS_NUMBER))
  end

  def create_deck
    result = []
    (2..14).each do |value|
      %w[H D C S].map { |suit| result.push(Card.new(suit, value)) }
    end
    result
  end

  def give_cards(cards_number)
    cards_given = @deck.sample(cards_number)
    cards_given.each do |card|
      @deck.delete(card)
    end
    cards_given
  end

    def pair
=begin
      if (@combination_cards.all?{|elem|.length == 2 } == 2)
        print'pair'
      end
=end
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

  def find_same_value()
    @all_cards = @player.received_cards + @board.received_cards
    @same_value_arr = []
    @all_cards.each_with_index do |card, i|
      @same_value_arr.push(card) if card[i].value == card[i + 1].value
    end
    @same_value_arr.uniq
  end

  def find_same_suit
    # @all_cards = @player.received_cards + @board.received_cards
    # if  @all_cards.combination(2) { |a, b| a == b }
    #
    # end

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
  #end of class Game
end


game = Game.new
game.create_deck
#game.return_result
game.find_same_value