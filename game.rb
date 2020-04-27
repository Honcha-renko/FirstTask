# frozen_string_literal: true
require_relative 'card'
require_relative 'board'
require_relative 'player'

class Game
  attr_reader :player
  attr_reader :board
  def initialize
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
    @combination_cards = find_same_value
    if (@combination_cards.length == 2)
      puts 'pair'
    end
  end

  def two_pair
    # still thinking about logic of method
    @combination_cards = find_same_value
    if @combination_cards.length == 2
      puts 'two_pair'
    end
  end

  def three_of_kind
    @combination_cards = find_same_value
    if @combination_cards.length == 3
      puts 'three_of_kind'
    end
  end

  def straight
    @combination_cards = find_sequence
    if @combination_cards == 5
      puts 'straight'
    end
  end

  def flush
    @combination_cards = find_same_suit
    if @combination_cards.length == 5
      puts 'flush'
  end
  end

  def full_house
    @combination_cards = find_same_value
    @combination_cards2 = find_same_value
    if (@combination_cards.length == 3||@combination_cards.length==2) &&
        (@combination_cards2.length==2||@combination_cards2.length==3) &&
        @combination_cards2!=@combination_cards
      puts 'full_house'
    end
  end

  def four_of_a_kind
    @combination_cards = find_same_value
    if @combination_cards.length == 4
      puts 'four_of_a_kind'
    end
  end

  def straight_flush
    @combination_cards = find_sequence
    @combination_cards2 = find_same_suit
    if @combination_cards2.length == 5 && (@combination_cards&@combination_cards2).length == 5
      puts 'straight_flush'
    end
  end

  def royal_flush
    @combination_cards = find_sequence
    @combination_cards2 = find_same_suit

    if @combination_cards2.length == 5 &&
       (@combination_cards & @combination_cards2).length == 5 && check_sequence
      puts 'royal_flush'
    end
  end

  def check_sequence
    check_result = []
    (10..14).each do |i|
      check_result << @combination_cards.any? {card.value ==i }
    end
    return true if check_result.all?{ |x| x == true }
  end

  def find_same_value
    @all_cards = @player.received_cards + @board.received_cards
    @same_value_arr = []
    @all_cards.each_with_index do |card, i|
      if @all_cards[i].value == @all_cards[i + 1].value
         @same_value_arr.push(card)
      end
      break if @all_cards[i + 1].nil?
    end
    @same_value_arr.uniq
  end

  def find_same_suit
    @all_cards = @player.received_cards + @board.received_cards
    @same_value_arr = []
    @all_cards.each_with_index do |card, i|
      if @all_cards[i].suit == @all_cards[i + 1].suit
         @same_value_arr.push(card)
      end
      break if @all_cards[i + 1].nil?
    end
    @same_value_arr.uniq
  # end of  find_same_suit
  end

  def find_sequence
    @all_cards.sort_by { |card |card.value  }
    if @all_cards.each_with_index do |card,i |
      card[i] < card[i+1]
    end
      true
    end
    # end of  find_sequence
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
puts game.return_result