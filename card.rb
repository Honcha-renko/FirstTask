# frozen_string_literal: true

class Card
  attr_reader :suit, :value
  def initialize(suit, value)
    # initialization of variables of Card class
    @suit = suit
    @value = value
  end
end
