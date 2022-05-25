***Settings***
Library  black_jack.py

***Test Cases***

Test case value_of_card function 
    ${value} =  black_jack.value_of_card  K
    SHOULD BE EQUAL  ${value}  ${10}
    ${value} =  black_jack.value_of_card  A
    SHOULD BE EQUAL  ${value}  ${1}
    ${value} =  black_jack.value_of_card  J
    SHOULD BE EQUAL  ${value}  ${10}
    ${value} =  black_jack.value_of_card  ${10}
    SHOULD BE EQUAL  ${value}  ${10}
    ${value} =  black_jack.value_of_card  ${8}
    SHOULD BE EQUAL  ${value}  ${8}
    ${value} =  black_jack.value_of_card  ${3}
    SHOULD NOT BE EQUAL  ${value}  ${5}

Test case higher_card function 
    ${value} =  black_jack.higher_card  K  ${8}
    SHOULD BE EQUAL  ${value}  K 
    ${value} =  black_jack.higher_card  A  ${8}
    SHOULD BE EQUAL  ${value}  ${8}
    ${value} =  black_jack.higher_card  J  ${10}
    ${value} =  Convert To String  ${value}
    SHOULD BE EQUAL  ${value}  ('J', ${10})
    ${value} =  black_jack.higher_card  ${5}  ${9}
    SHOULD BE EQUAL  ${value}  ${9}
    ${value} =  black_jack.higher_card  ${8}  ${8}
    ${value} =  Convert To String  ${value}
    SHOULD BE EQUAL  ${value}  (${8}, ${8})
    ${value} =  black_jack.higher_card  K  Q
    ${value} =  Convert To String  ${value}
    SHOULD BE EQUAL  ${value}  ('K', 'Q')
    ${value} =  black_jack.higher_card  ${3}  ${8}
    SHOULD NOT BE EQUAL  ${value}  ${5}



test case value of ace function 
    ${value} =  black_jack.value_of_ace  K  ${8}
    SHOULD BE EQUAL  ${value}  ${1} 
    ${value} =  black_jack.value_of_ace  ${4}  ${5}
    SHOULD BE EQUAL  ${value}  ${11}
    ${value} =  black_jack.value_of_ace  ${7}  ${3}
    SHOULD BE EQUAL  ${value}  ${11}
    ${value} =  black_jack.value_of_ace  ${8}  ${3}
    SHOULD BE EQUAL  ${value}  ${1}


test case is black_jack function
    ${value} =  black_jack.is_blackjack  K  ${8}
    SHOULD BE EQUAL  ${value}  ${False}
    ${value} =  black_jack.is_blackjack  K  Q
    SHOULD BE EQUAL  ${value}  ${False}
    ${value} =  black_jack.is_blackjack  ${8}  ${8}
    SHOULD BE EQUAL  ${value}  ${False}
    ${value} =  black_jack.is_blackjack  K  A
    SHOULD BE EQUAL  ${value}  ${True}
    ${value} =  black_jack.is_blackjack  ${10}  A
    SHOULD BE EQUAL  ${value}  ${True}
    

test case can double down function 
    ${value} =  black_jack.can_double_down  K  ${8}
    SHOULD BE EQUAL  ${value}  ${False}
    ${value} =  black_jack.can_double_down  ${4}  ${5}
    SHOULD BE EQUAL  ${value}  ${True}
    ${value} =  black_jack.can_double_down  ${6}  ${5}
    SHOULD BE EQUAL  ${value}  ${True}
    ${value} =  black_jack.can_double_down  A  ${8}
    SHOULD BE EQUAL  ${value}  ${True}
    ${value} =  black_jack.can_double_down  A  K
    SHOULD BE EQUAL  ${value}  ${True}
    
    



