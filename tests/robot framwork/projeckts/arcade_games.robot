***Settings***
Library  arcade_games.py

***Test Cases***

Test with arcade_games founction eat_ghost 
    ${value} =  arcade_games.eat_ghost  ${True}  ${True}
    SHOULD BE EQUAL  ${value}  ${True}
    ${value} =  arcade_games.eat_ghost  ${False}  ${True}
    SHOULD BE EQUAL  ${value}  ${False}
    ${value} =  arcade_games.eat_ghost  ${True}  ${False}
    SHOULD BE EQUAL  ${value}  ${False}

Test with arcade games function score
    ${value} =  arcade_games.score  ${True}  ${False}
    SHOULD BE EQUAL  ${value}  ${True}
    ${value} =  arcade_games.score  ${False}  ${True}
    SHOULD BE EQUAL  ${value}  ${True}
    ${value} =  arcade_games.score  ${True}  ${True}
    SHOULD BE EQUAL  ${value}  ${True}
    ${value} =  arcade_games.score  ${False}  ${False}
    SHOULD BE EQUAL  ${value}  ${False}


Test with arcade games function lose 
    ${value} =  arcade_games.lose  ${False}  ${True}
    SHOULD BE EQUAL  ${value}  ${True}
    ${value} =  arcade_games.lose  ${True}  ${True}
    SHOULD BE EQUAL  ${value}  ${False}
    ${value} =  arcade_games.lose  ${True}  ${False}
    SHOULD BE EQUAL  ${value}  ${False}

Test with arcade games function win 
    ${value} =  arcade_games.win  ${True}  ${False}  ${False} 
    SHOULD BE EQUAL  ${value}  ${True}
    ${value} =  arcade_games.win  ${True}  ${True}  ${False} 
    SHOULD BE EQUAL  ${value}  ${True}
    ${value} =  arcade_games.win  ${True}  ${False}  ${True} 
    SHOULD BE EQUAL  ${value}  ${False}
    ${value} =  arcade_games.win  ${True}  ${True}  ${True} 
    SHOULD BE EQUAL  ${value}  ${True}
    ${value} =  arcade_games.win  ${False}  ${False}  ${False} 
    SHOULD BE EQUAL  ${value}  ${False}