module Blackjack
  def self.parse_card(card)
    case card
    when 'ace' then 11
    when 'two' then 2
    when 'three' then 3
    when 'four' then 4
    when 'five' then 5
    when 'six' then 6
    when 'seven' then 7
    when 'eight' then 8
    when 'nine' then 9
    when 'ten' then 10
    when 'jack' then 10
    when 'queen' then 10
    when 'king' then 10
    else 0
    end
  end

  def self.card_range(card1, card2)
    case parse_card(card1) + parse_card(card2)
    when 21 then 'blackjack'
    when (17..20) then 'high'
    when (12..16) then 'mid'
    when (4..11) then 'low'
    when 22 then 'no chance'
    else 'error'
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    case card_range(card1, card2)
    when 'high' then 'S'
    when 'mid'
      if parse_card(dealer_card) < 7
        'S'
      else
        'H'
      end
    when 'low' then 'H'
    when 'blackjack'
      if parse_card(dealer_card) < 10
        'W'
      else
        'S'
      end
    when 'no chance' then 'P'
    end
  end
end

t2 = Blackjack.first_turn("ace", "ace", "two")
p t2
