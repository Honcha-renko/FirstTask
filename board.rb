
class Board < Holders
  # number of cards that should be given
  REQUIRED_CARDS_NUMBER = 2
  attr_reader :received_cards, :required_card_number

  def initialize(cards)
    @required_card_number = REQUIRED_CARDS_NUMBER
    @received_cards = cards
  end
end
