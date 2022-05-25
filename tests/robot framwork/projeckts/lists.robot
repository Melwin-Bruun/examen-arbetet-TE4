***Settings***
Library  lists.py

***Test Cases***

Test case get_rounds function 

    ${value}=  lists.get_rounds  ${1}
    ${value}=  Convert to String  ${value}
    SHOULD BE EQUAL  ${value}   [${1}, ${2}, ${3}]
    ${value}=  lists.get_rounds  ${1}
    ${value}=  Convert to String  ${value}
    SHOULD NOT BE EQUAL  ${value}   [${1}, ${3}, ${4}]
    ${value}=  lists.get_rounds  ${3}
    ${value}=  Convert to String  ${value}
    SHOULD BE EQUAL  ${value}   [${3}, ${4}, ${5}]

Test case concatenate_rounds founction 

    ${round1}=  Create List  ${1}  ${2}
    ${round2}=  Create List  ${3}  ${4}
    ${value}=  lists.concatenate_rounds  ${round1}  ${round2}
    ${value}=  Convert to String  ${value}
    SHOULD BE EQUAL  ${value}   [${1}, ${2}, ${3}, ${4}]
    ${round1}=  Create List  ${1}  ${2}
    ${round2}=  Create List  ${3}  ${4}
    ${value}=  lists.concatenate_rounds  ${round1}  ${round2}
    ${value}=  Convert to String  ${value}
    SHOULD NOT BE EQUAL  ${value}   [${3}, ${4}, ${1}, ${2}]

Test case list_contains_round founction 

    ${round1}=  Create List  ${1}  ${2}
    ${value}=  lists.list_contains_round  ${round1}  ${2}
    SHOULD BE EQUAL  ${value}   ${True}
    ${value}=  lists.list_contains_round  ${round1}  ${3}
    SHOULD BE EQUAL  ${value}   ${False}


Test case card_average founction 

    ${round1}=  Create List  ${1}  ${2}  ${4}  ${5}  ${7}  ${8}
    ${value}=  lists.card_average  ${round1}
    SHOULD BE EQUAL  ${value}   ${4.5}
    ${round}=  Create List  ${2}  ${2}  
    ${value}=  lists.card_average  ${round}
    SHOULD BE EQUAL  ${value}   ${2}
    ${value}=  lists.card_average  ${round1} 
    SHOULD NOT BE EQUAL  ${value}   ${4}

Test case approx_average_is_average founction 

    ${round1}=  Create List  ${1}  ${2}  ${4}  ${5}  ${7}  ${8}
    ${value}=  lists.approx_average_is_average  ${round1}
    SHOULD BE EQUAL  ${value}   ${True}
    ${round}=  Create List  ${2}  ${2}  
    ${value}=  lists.approx_average_is_average  ${round}
    SHOULD BE EQUAL  ${value}   ${True}
    ${round}=  Create List  ${2}  ${3}  ${4}  ${5}  ${7}  ${8}
    ${value}=  lists.approx_average_is_average  ${round}
    SHOULD BE EQUAL  ${value}   ${False}

Test case maybe_double_last founction 

    ${round1}=  Create List  ${1}  ${11}
    ${value}=  lists.maybe_double_last  ${round1}
    ${value}=  Convert to String  ${value}
    SHOULD BE EQUAL  ${value}   [${1}, ${22}]
    ${round}=  Create List  ${11}  ${2}  
    ${value}=  lists.maybe_double_last  ${round}
    ${value}=  Convert to String  ${value}
    SHOULD BE EQUAL  ${value}   [${11}, ${2}]
    ${round}=  Create List  ${2}  ${11}  ${7}
    ${value}=  lists.maybe_double_last  ${round}
    ${value}=  Convert to String  ${value}
    SHOULD BE EQUAL  ${value}   [${2}, ${11}, ${7}]
