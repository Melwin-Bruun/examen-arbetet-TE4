from ast import And


def eat_ghost(power_pellet_active, touching_ghost):
    """

    :param power_pellet_active: bool - does the player have an active power pellet?
    :param touching_ghost:  bool - is the player touching a ghost?
    :return: bool
    """
    eat = False
    if ((power_pellet_active == True) and (touching_ghost == True)):
        eat = True

    return eat


def score(touching_power_pellet, touching_dot):
    """

    :param touching_power_pellet: bool - does the player have an active power pellet?
    :param touching_dot:  bool - is the player touching a dot?
    :return: bool
    """
    score = False
    if ((touching_power_pellet == True) or (touching_dot == True)):
        score = True

    return score


def lose(power_pellet_active, touching_ghost):
    """

    :param power_pellet_active: bool - does the player have an active power pellet?
    :param touching_ghost: bool - is the player touching a ghost?
    :return: bool
    """
    eat = False
    if ((power_pellet_active == False) and (touching_ghost == True)):
        eat = True

    return eat


def win(has_eaten_all_dots, power_pellet_active, touching_ghost):
    """

    :param has_eaten_all_dots: bool - has the player "eaten" all the dots?
    :param power_pellet_active: bool - does the player have an active power pellet?
    :param touching_ghost:  bool - is the player touching a ghost?
    :return: bool
    """
    win = False
    if ((has_eaten_all_dots == True) and (lose(power_pellet_active,touching_ghost) == False)):
        win = True

    return win
