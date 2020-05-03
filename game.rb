# frozen_string_literal: true

require_relative 'card'
require_relative 'board'
require_relative 'player'

class Game
  attr_reader :player, :board, :deck
  def initialize
    @deck = create_deck
  end

  def all_cards
    # give cards to player and put cards on the table
    @all_cards ||= begin
                     player = Player.new(give_cards(Player::REQUIRED_CARDS_NUMBER))
                     board = Board.new(give_cards(Board::REQUIRED_CARDS_NUMBER))
                     player.received_cards + board.received_cards
                   end
  end

  def create_deck
    result = []
    (2..14).each do |value|
      %w[H D C S].map { |suit| result.push(Card.new(suit, value)) }
    end
    result
  end

  def give_cards(cards_number)
    cards_given = deck.sample(cards_number)
    cards_given.each { |card| deck.delete(card) }
    cards_given
  end

  def pair
    combination_cards = find_same_value
    combination_cards.length == 2
  end

  def two_pair
    same_value_cards = []
    same_value_cards << deck.each { |i| deck.select { |card| card.value = i.value } }
    same_value_cards.uniq
    same_value_cards == 2
  end

  def three_of_kind
    combination_cards = find_same_value
    combination_cards.length == 3
  end

  def straight
    combination_cards = find_sequence
    combination_cards == 5
  end

  def flush
    combination_cards = find_same_suit
    combination_cards.length == 5
  end

  def full_house
    sequenced_cards  = find_sequence
    suited_cards     = find_same_suit

    (sequenced_cards.length == 3||sequenced_cards.length == 2) &&
      (suited_cards.length == 2 || suited_cards.length == 3) &&
      suited_cards != sequenced_cards
  end

  def four_of_a_kind
    combination_cards = find_same_value
    combination_cards.length == 4
  end

  def straight_flush
    sequenced_cards  = find_sequence
    suited_cards     = find_same_suit

    suited_cards.length == 5 && (sequenced_cards & suited_cards).length == 5
  end

  def royal_flush
    sequenced_cards  = find_sequence
    suited_cards     = find_same_suit

    suited_cards.length == 5 &&
      (sequenced_cards & suited_cards).length == 5 &&
      check_sequence_for_high_cards(sequenced_cards)
  end

  def check_sequence_for_high_cards(cards)
    check_result = []
    (10..14).each do |i|
      check_result << cards.any? { |card| card.value == i }
    end
    check_result.all? { |x| x == true }
  end

  def find_same_value
    same_value_arr = []
    all_cards.each_with_index do |card, i|
      if all_cards[i].value == all_cards[i + 1].value
        same_value_arr.push(card)
      end
      break if all_cards[i + 1].nil?
    end
    same_value_arr.uniq
  end

  def find_same_suit
    same_suit_arr = []
    all_cards.each_with_index do |card, i|
      if all_cards[i].suit == all_cards[i + 1].suit
        same_suit_arr.push(card)
      end
      break if all_cards[i + 1].nil?
    end
    same_suit_arr.uniq
  end

  def find_sequence
    @all_cards.sort_by(&:value)
    true if @all_cards.each_with_index do |card, i|
      card[i].value < card[i + 1].value
    end
  end

  def return_result
    return 'royal_flush' if royal_flush
    return 'straight_flush' if straight_flush
    return 'four_of_a_kind' if four_of_a_kind
    return 'full_house' if full_house
    return 'flush' if flush
    return 'straight' if straight
    return 'three_of_kind' if three_of_kind
    return 'two_pair' if two_pair
    return 'pair' if pair
  end
end

game = Game.new
puts game.return_result
