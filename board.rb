class Board
  attr_reader :received_сards

  @required_number_of_cards = 5 # number of cards that should be given
  @received_сards= []
  def initialize(cards)
    @received_сards = cards # received cards
  end
end
