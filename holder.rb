# frozen_string_literal: true

class Holder
  attr_reader :received_cards
  def initialize(cards)
    @received_cards = cards
  end
end
