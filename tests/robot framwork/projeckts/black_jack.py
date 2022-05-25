"""Functions to help play and score a game of blackjack.

How to play blackjack:    https://bicyclecards.com/how-to-play/blackjack/
"Standard" playing cards: https://en.wikipedia.org/wiki/Standard_52-card_deck
"""

try:
    from robot.libraries.BuiltIn import BuiltIn
    from robot.libraries.BuiltIn import _Misc
    import robot.api.logger as logger
    from robot.api.deco import keyword
    ROBOT = False
except Exception:
    ROBOT = False

def value_of_card(card):
    """Determine the scoring value of a card.

    :param card: str - given card.
    :return: int - value of a given card (J, Q, K = 10, 'A' = 1) numerical value otherwise.
    """
    
    if card in ('K', 'Q', 'J'):
        res = 10
    elif card == 'A':
        res = 1
    else:
        res = int(card)
    BuiltIn().log_to_console(f"Input {card} , Output {res}")
    return res
    

def higher_card(card_one, card_two):
    """Determine which card has a higher value in the hand.

    :param card_one, card_two: str - cards dealt.  J, Q, K = 10, 'A' = 1, all others are numerical value.
    :return: higher value card - str. Tuple of both cards if they are of equal value.
    """

    if (value_of_card(card_one) < value_of_card(card_two)):
        BuiltIn().log_to_console(f"Input {card_one} and {card_two}, Output {card_two}")
        return card_two
    elif value_of_card(card_one) > value_of_card(card_two):
        BuiltIn().log_to_console(f"Input {card_one} and {card_two}, Output {card_one}")
        return card_one
    else:
        BuiltIn().log_to_console(f"Input {card_one} and {card_two}, Output {card_two , card_one}")
        return card_one , card_two


def value_of_ace(card_one, card_two):
    """Calculate the most advantageous value for the ace card.

    :param card_one, card_two: str - card (J, Q, K == 10, numerical value otherwise)
    :return: int - value of the upcoming ace card (either 1 or 11).
    """

    value_one = value_of_card(card_one)
    value_two = value_of_card(card_two)

    if value_one + value_two <= 21 - 11:
        value_ace = 11
        BuiltIn().log_to_console(f" Output value of ace {value_ace}")
        return value_ace
    elif value_one + value_two > 21 - 11:
        value_ace = 1
        BuiltIn().log_to_console(f"Output value of ace {value_ace}")
        return value_ace


def is_blackjack(card_one, card_two):
    """Determine if the hand is a 'natural' or 'blackjack'.

    :param card_one, card_two: str - cards dealt.  J, Q, K = 10, 'A' = 11, all others are numerical value.
    :return: bool - if the hand is a blackjack (two cards worth 21).
    """
    value_of_card_one = value_of_card(card_one)
    
    if value_of_card(card_one) == 1:
        value_of_card_one = 11
    
    value_of_card_two = value_of_card(card_two)
    
    if value_of_card(card_two) == 1:
        value_of_card_two = 11


    if (value_of_card_two + value_of_card_one == 21):
        return True
    else:
        return False
    


def can_split_pairs(card_one, card_two):
    """Determine if a player can split their hand into two hands.

    :param card_one, card_two: str - cards in hand.
    :return: bool - if the hand can be split into two pairs (i.e. cards are of the same value).
    """

    value_one = value_of_card(card_one)
    value_two = value_of_card(card_two)
    if (value_one == value_two ):
        return True
    else:
        return False


def can_double_down(card_one, card_two):
    """Determine if a blackjack player can place a double down bet.

    :param card_one, card_two: str - first and second cards in hand.
    :return: bool - if the hand can be doubled down (i.e. totals 9, 10 or 11 points).
    """

    value_one = value_of_card(card_one)
    value_two = value_of_card(card_two)

    if value_one + value_two == 9 or value_one + value_two == 10 or value_one + value_two == 11:
        return True 
    else: 
        return False