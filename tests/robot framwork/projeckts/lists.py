from pickle import APPEND
try:
    from robot.libraries.BuiltIn import BuiltIn
    from robot.libraries.BuiltIn import _Misc
    import robot.api.logger as logger
    from robot.api.deco import keyword
    ROBOT = False
except Exception:
    ROBOT = False

def get_rounds(number):
    """

     :param number: int - current round number.
     :return: list - current round and the two that follow.
    """

    num = []
    i = 0

    while i < 3 :
        num.append(number + i)
        i += 1
    return num


def concatenate_rounds(rounds_1, rounds_2):
    """

    :param rounds_1: list - first rounds played.
    :param rounds_2: list - second set of rounds played.
    :return: list - all rounds played.
    """
    for i in rounds_2:
        rounds_1.append(i)
    return rounds_1


    


def list_contains_round(rounds, number):
    """

    :param rounds: list - rounds played.
    :param number: int - round number.
    :return:  bool - was the round played?
    """

    for i in rounds:
        if i == number:
            return True 
    return False 
    


def card_average(hand):
    """

    :param hand: list - cards in hand.
    :return:  float - average value of the cards in the hand.
    """
    return sum(hand) / len(hand)


def approx_average_is_average(hand):
    """

    :param hand: list - cards in hand.
    :return: bool - if approximate average equals to the `true average`.
    """

    return card_average(hand) == card_average([hand[0], hand[-1]]) or card_average(hand) == hand[len(hand)//2]


def average_even_is_average_odd(hand):
    """

    :param hand: list - cards in hand.
    :return: bool - are even and odd averages equal?
    """

    even = hand[0::2]
    odd = hand[1::2]
    return (sum(even) / len(even)) == (sum(odd) / len(odd))


def maybe_double_last(hand):
    """

    :param hand: list - cards in hand.
    :return: list - hand with Jacks (if present) value doubled.
    """

    if hand[-1] == 11: 
        hand[-1] = 11*2 
        return hand 
    return hand 
