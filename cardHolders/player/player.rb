# frozen_string_literal: true
class Player
  attr_reader :received_cards

  @@required_number_of_cards = 2 # number of cards that should be given
  @@received_cards= []
  def initialize(cards)
    @received_cards << cards # received cards
  end
end
