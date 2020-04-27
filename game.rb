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
      %w[H D C S].map { |suit| result << Card.new(suit, value) }
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

  def find_same_value
    @all_cards = @player.received_cards + @board.received_cards
    puts @all_cards.combination(2), @all_cards.combination(2).inspect
    pairs = @all_cards.combination(2).select { |arr| arr[1].value == arr[2].value }
  end
    # @combination = @all_cards.combination(2)
    # @same_value_arr = []
    # @combination.each do |pair, i|
    #   if (pair[i].value == pair[i+1].value)
    #     @same_value_arr.append(pair)
    #   end
    # end
    # if @combination
    #  .any? { |a, b| a.value == b.value }
    # return while (@all_cards.combination(2){ |a, b| a.value == b.value })
    #
    # end


  def find_same_suit
    @all_cards = @player.received_cards + @board.received_cards
    if  @all_cards.combination(2) {|a, b| a == b }

    end

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