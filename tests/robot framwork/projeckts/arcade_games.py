from ast import And
try:
    from robot.libraries.BuiltIn import BuiltIn
    from robot.libraries.BuiltIn import _Misc
    import robot.api.logger as logger
    from robot.api.deco import keyword
    ROBOT = False
except Exception:
    ROBOT = False


def eat_ghost(power_pellet_active, touching_ghost):
    """

    :param power_pellet_active: bool - does the player have an active power pellet?
    :param touching_ghost:  bool - is the player touching a ghost?
    :return: bool
    """
    eat = False
    if ((power_pellet_active == True) and (touching_ghost == True)):
        eat = True
    BuiltIn().log_to_console(f"Input {power_pellet_active} and {touching_ghost}, Output {eat}")
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
    BuiltIn().log_to_console(f"Input {touching_power_pellet} and {touching_dot}, Output {score}")
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
    BuiltIn().log_to_console(f" lose Function: Input {power_pellet_active} and {touching_ghost}, Output {eat}")
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
    BuiltIn().log_to_console(f"Input {power_pellet_active} and {touching_ghost} and {has_eaten_all_dots}, Output {win}")
    return win
